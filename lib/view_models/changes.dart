import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:prod_dev_23/models/app_state.dart';
import 'package:prod_dev_23/services/service_imp.dart';
import 'package:prod_dev_23/services/services.dart';

class Changes extends StatelessWidget {
  const Changes({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<MyModel, AppState>(
      create: (c) => MyModel(),
      child: child,
    );
  }
}

class MyModel extends StateNotifier<AppState> with LocatorMixin {
  MyModel() : super(AppState());

  Services obj = new ServiceImp();

  // Future<void> postNewMemory() async {
  //   final BuiltList<Post> a = await obj.();
  //   state = state.rebuild((p0) {
  //     p0.myPosts = a.toBuilder();
  //   });
  // }
}
