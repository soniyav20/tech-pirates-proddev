import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:prod_dev_23/models/app_state.dart';
import 'package:prod_dev_23/models/post.dart';

part 'serializers.g.dart';

@SerializersFor([
  // TODO: add the built values that require serialization
  AppState
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
