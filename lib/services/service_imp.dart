import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prod_dev_23/models/post.dart';
import 'package:prod_dev_23/services/services.dart';

class ServiceImp implements Services {
  @override
  Future<void> resetPass({String? email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email ?? '');
  }

  @override
  Future<void> signin({String? mail, String? pass}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: mail ?? '', password: pass ?? '');
  }

  @override
  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> signup({String? name, String? mail, String? pass}) async {
    UserCredential userc;
    userc = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: mail ?? '', password: pass ?? '');
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userc.user!.uid)
        .set({"mail": mail, "name": name, "id": userc.user!.uid});
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: mail ?? '', password: pass ?? '');
  }

  @override
  Future<void> postMemory(String memory, double? latitude, double? logitude,
      String? address, String imageUrl) async {
    final uidd = await FirebaseAuth.instance.currentUser!.uid;
    print(uidd);
    final feeds = await FirebaseFirestore.instance.collection('memories').doc();
    Post newFeed = Post((b) => b
      ..address = address
      ..userId = uidd
      ..imageUrl = imageUrl
      ..latitude = latitude
      ..longitude = logitude
      ..time = Timestamp.now().toDate().toString()
      ..memory = memory);
    feeds.set(newFeed.toJson());
    print("Added");
  }

  Future<BuiltList<Post>> getMyMemories() async {
    final uidd = await FirebaseAuth.instance.currentUser!.uid;
    final QuerySnapshot<Map<String, dynamic>> _collectionRef =
        await FirebaseFirestore.instance
            .collection('memories')
            .where('userId', isEqualTo: uidd)
            .orderBy('time', descending: true)
            .get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshot =
        _collectionRef.docs;
    List<Post> list = [];
    snapshot.forEach((element) {
      list.add(Post.fromJson(element.data()));
    });
    print(list);
    return list.toBuiltList();
  }

  Future<void> delPost(String postId) async {
    await FirebaseFirestore.instance
        .collection('needWorkers')
        .doc(postId)
        .delete();
  }

  Future<void> updateMemory(String postId, String memory) async {
    await FirebaseFirestore.instance
        .collection('needWorkers')
        .doc(postId)
        .update({"memory": memory});
  }
}
