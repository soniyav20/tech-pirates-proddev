import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prod_dev_23/models/serializers.dart';

part 'post.g.dart';

abstract class Post implements Built<Post, PostBuilder> {
  Post._();
  factory Post([void Function(PostBuilder) updates]) = _$Post;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Post.serializer, this)
        as Map<String, dynamic>;
  }

  static Post fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Post.serializer, json)!;
  }

  static Serializer<Post> get serializer => _$postSerializer;
  String get memory;
  double? get latitude;
  double? get longitude;
  String? get address;
  String? get imageUrl;
  String get userId;
  String get time;
}
