import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:prod_dev_23/services/service_imp.dart';
import 'package:prod_dev_23/services/services.dart';
import 'package:share/share.dart';

class ShareButtonPage extends StatefulWidget {
  const ShareButtonPage({Key? key}) : super(key: key);

  @override
  State<ShareButtonPage> createState() => _ShareButtonPageState();
}

class _ShareButtonPageState extends State<ShareButtonPage> {
  String? _currentAddress;
  Position? _currentPosition;
  File? _photo;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context as BuildContext).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
        '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  void _shareMemory() {

    String shareContent = "Hey, how was your day?\n\n";
    if (_currentAddress != null) {
      shareContent += "Location: $_currentAddress\n";
    }

    String imageUrl = 'https://miro.medium.com/v2/resize:fit:640/format:webp/1*AUyrve2ecHJlXkdXfjv0Fw.png';
    shareContent += "Image: $imageUrl\n";

    Share.share(shareContent).then((value) {

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Memory Page"),
        actions: <Widget>[
          Row(
            children: [
              // IconButton(
              //   icon: Icon(Icons.delete),
              //   onPressed: () {
              //     Services obj =new ServiceImp();
              //     obj.delPost(postId)
              //   },
              // ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  _shareMemory();
                },
              ),
            ],
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 80,),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: const Color(0xffFDCF09),
                      child: _photo != null
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          _photo!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                          : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50)),
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    maxLength: 500,
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Hey!, How your day?',
                    ),
                  ),
                ),
                // Text('LAT: ${_currentPosition?.latitude ?? ""}'),
                // Text('LNG: ${_currentPosition?.longitude ?? ""}'),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _getCurrentPosition,
                  child: const Text("Get Current Location"),
                ),
                Text('ADDRESS: ${_currentAddress ?? ""}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  // File? _photo;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(_photo!);
    } catch (e) {
      print('error occured');
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Gallery'),
                    onTap: () {
                      imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

}
