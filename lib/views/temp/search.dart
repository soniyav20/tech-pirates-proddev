import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:prod_dev_23/models/post.dart';
import 'package:prod_dev_23/services/service_imp.dart';
import 'package:prod_dev_23/view_models/changes.dart';

import 'package:provider/provider.dart';

import '../../services/services.dart';

class QueryCustomDelegate extends SearchDelegate {
  QueryCustomDelegate();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  Services imp = ServiceImp();

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    BuiltList<Post> queries = context.read<MyModel>().state.myPosts!;
    final results = queries.where(
            (book) => (book.memory!=null && book.memory!.toLowerCase().contains(query.toLowerCase()))||(book.address!=null && book.address!.toLowerCase().contains(query.toLowerCase())));
    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        final book = results.elementAt(index);
        return Padding(
          padding: EdgeInsets.all(8),
          child: SizedBox(
            child:                         Card(
          child: ListTile(
          title: Column(
              children: [
              Image(
              image: NetworkImage(''),
        ),
        Text("Memory:${book.memory}"),
        Row(
        children: [
        Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.date_range),
        ),
        Text(
        "${book.time.toString().substring(0, 11)}"),
        ],
        ),
        Row(
        children: [
        Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.timer),
        ),
        Text(
        "${book.time.toString().substring(11, 19)}"),
        ],
        ),
        Row(
        children: [
        Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.wrong_location),
        ),
        Text(
        "${book.address ?? "Not Added"}"),
        ],
        ),
        ],
        )),
        )));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}