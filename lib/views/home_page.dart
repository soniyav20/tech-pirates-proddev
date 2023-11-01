import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:prod_dev_23/view_models/changes.dart';
import 'package:prod_dev_23/views/final_upload_page.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    BuiltList? list = context.read<MyModel>().state.myPosts;
    return RefreshIndicator(
      onRefresh: _refresh,
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Memories"),
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
                              Image(
                                image: NetworkImage(''),
                              ),
                              Text("Memory:${list![index].memory}"),
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
                                  Text(
                                      "${list![index].address ?? "Not Added"}"),
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
