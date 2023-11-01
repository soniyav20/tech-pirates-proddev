import 'package:built_collection/built_collection.dart';
import 'package:prod_dev_23/models/post.dart';

abstract class Services {
  Future<void> resetPass({String? email});
  Future<void> signin({String? mail, String? pass});
  Future<void> signout();
  Future<void> signup({String? name, String? mail, String? pass});
  Future<void> postMemory(String memory, double? latitude, double? logitude,
      String? address, String imageUrl);
  Future<BuiltList<Post>> getMyMemories();
  Future<void> delPost(String postId);
  Future<void> updateMemory(String postId, String memory);
}
