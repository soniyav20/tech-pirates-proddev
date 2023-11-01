import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:prod_dev_23/services/service_imp.dart';
import 'package:prod_dev_23/services/services.dart';
import 'package:prod_dev_23/view_models/changes.dart';
import 'package:prod_dev_23/views/final_upload_page.dart';
import 'package:prod_dev_23/views/temp/search.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> method() async {
    await context.read<MyModel>().getmemories();
    setState(() {});
  }

  Future<void> _refresh() async {
    await context.read<MyModel>().getmemories();

    setState(() {});
    return null;
  }

  @override
  void initState() {
    method();
    setState(() {});
    super.initState();
  }
  bool edit=false;

  @override
  Widget build(BuildContext context) {
    BuiltList? list = context.read<MyModel>().state.myPosts;
    TextEditingController memory=new TextEditingController();
    return RefreshIndicator(
      onRefresh: _refresh,
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Memories"),
          actions: [
            IconButton(onPressed: (){
              showSearch(
                context: context,
                delegate: QueryCustomDelegate(),
              );
            }, icon: Icon(Icons.search))
          ],
        ),
        backgroundColor: Colors.black,
        body: list != null
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                              title: Column(
                            children: [
                              Container(
                                height: 200,
                                child: Image.network(
                                      list![index].imageUrl,
                                  fit: BoxFit.fill,
                                  ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      Services obj =new ServiceImp();
                                      obj.delPost(list![index].id);
                                    },
                                  ),
                                  IconButton(onPressed: (){
                                    _shareMemory(list![index].memory, list![index].address, list![index].imageUrl, list![index].time.toString().substring(0, 11));
                                  }, icon: Icon(Icons.share)),
                                  edit==false?IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      setState(() {
                                        memory.text=list![index].memory;
                                        edit=true;
                                      });
                                    },):IconButton(
                                    icon: Icon(Icons.save),
                                    onPressed: () {
                                      Services obj =new ServiceImp();
                                      obj.updateMemory(list![index].id,memory.text);
                                      setState(() {
                                        edit=false;
                                      });
                                    },)
                                ],
                              ),
                              edit==true?TextFormField(controller: memory,):Container(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Memory:${list![index].memory}"),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.date_range),
                                  ),
                                  Text(
                                      "${list![index].time.toString().substring(0, 11)}"),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.timer),
                                  ),
                                  Text(
                                      "${list![index].time.toString().substring(11, 19)}"),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.wrong_location),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width-200,
                                    child: Text(
                                        "${list![index].address ?? "Not Added"}"),
                                  ),
                                ],
                              ),
                            ],
                          )),
                        );
                      }),
                ),
              )
            : Text("No feeds yet"),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LocationPage()),
            );
          },
        ),
      ),
    );
  }
}


void _shareMemory(String memory,String _address,String url,String date) {

  String shareContent = memory;
  if (_address != null) {
    shareContent += "Location: $_address\n";
  }

  String imageUrl = url;
  shareContent += "Image: $imageUrl\n";
  shareContent += "Date: $date\n";
  Share.share(shareContent).then((value) {

  });
}