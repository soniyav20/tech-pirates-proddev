// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Post> _$postSerializer = new _$PostSerializer();

class _$PostSerializer implements StructuredSerializer<Post> {
  @override
  final Iterable<Type> types = const [Post, _$Post];
  @override
  final String wireName = 'Post';

  @override
  Iterable<Object?> serialize(Serializers serializers, Post object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'memory',
      serializers.serialize(object.memory,
          specifiedType: const FullType(String)),
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
      'time',
      serializers.serialize(object.time,
          specifiedType: const FullType(Timestamp)),
    ];
    Object? value;
    value = object.latitude;
    if (value != null) {
      result
        ..add('latitude')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.longitude;
    if (value != null) {
      result
        ..add('longitude')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imageUrl;
    if (value != null) {
      result
        ..add('imageUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Post deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'memory':
          result.memory = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'latitude':
          result.latitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'longitude':
          result.longitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(Timestamp))! as Timestamp;
          break;
      }
    }

    return result.build();
  }
}

class _$Post extends Post {
  @override
  final String memory;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? address;
  @override
  final String? imageUrl;
  @override
  final String userId;
  @override
  final Timestamp time;

  factory _$Post([void Function(PostBuilder)? updates]) =>
      (new PostBuilder()..update(updates))._build();

  _$Post._(
      {required this.memory,
      this.latitude,
      this.longitude,
      this.address,
      this.imageUrl,
      required this.userId,
      required this.time})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(memory, r'Post', 'memory');
    BuiltValueNullFieldError.checkNotNull(userId, r'Post', 'userId');
    BuiltValueNullFieldError.checkNotNull(time, r'Post', 'time');
  }

  @override
  Post rebuild(void Function(PostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostBuilder toBuilder() => new PostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Post &&
        memory == other.memory &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        address == other.address &&
        imageUrl == other.imageUrl &&
        userId == other.userId &&
        time == other.time;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, memory.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Post')
          ..add('memory', memory)
          ..add('latitude', latitude)
          ..add('longitude', longitude)
          ..add('address', address)
          ..add('imageUrl', imageUrl)
          ..add('userId', userId)
          ..add('time', time))
        .toString();
  }
}

class PostBuilder implements Builder<Post, PostBuilder> {
  _$Post? _$v;

  String? _memory;
  String? get memory => _$this._memory;
  set memory(String? memory) => _$this._memory = memory;

  double? _latitude;
  double? get latitude => _$this._latitude;
  set latitude(double? latitude) => _$this._latitude = latitude;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(double? longitude) => _$this._longitude = longitude;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  Timestamp? _time;
  Timestamp? get time => _$this._time;
  set time(Timestamp? time) => _$this._time = time;

  PostBuilder();

  PostBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _memory = $v.memory;
      _latitude = $v.latitude;
      _longitude = $v.longitude;
      _address = $v.address;
      _imageUrl = $v.imageUrl;
      _userId = $v.userId;
      _time = $v.time;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Post other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Post;
  }

  @override
  void update(void Function(PostBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Post build() => _build();

  _$Post _build() {
    final _$result = _$v ??
        new _$Post._(
            memory: BuiltValueNullFieldError.checkNotNull(
                memory, r'Post', 'memory'),
            latitude: latitude,
            longitude: longitude,
            address: address,
            imageUrl: imageUrl,
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'Post', 'userId'),
            time: BuiltValueNullFieldError.checkNotNull(time, r'Post', 'time'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
