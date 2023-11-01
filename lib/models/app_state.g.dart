// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'myPosts',
      serializers.serialize(object.myPosts,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Post)])),
    ];
    Object? value;
    value = object.currentMemoryPost;
    if (value != null) {
      result
        ..add('currentMemoryPost')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Post)));
    }
    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'currentMemoryPost':
          result.currentMemoryPost.replace(serializers.deserialize(value,
              specifiedType: const FullType(Post))! as Post);
          break;
        case 'myPosts':
          result.myPosts.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Post)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final Post? currentMemoryPost;
  @override
  final BuiltList<Post> myPosts;

  factory _$AppState([void Function(AppStateBuilder)? updates]) =>
      (new AppStateBuilder()..update(updates))._build();

  _$AppState._({this.currentMemoryPost, required this.myPosts}) : super._() {
    BuiltValueNullFieldError.checkNotNull(myPosts, r'AppState', 'myPosts');
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        currentMemoryPost == other.currentMemoryPost &&
        myPosts == other.myPosts;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currentMemoryPost.hashCode);
    _$hash = $jc(_$hash, myPosts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppState')
          ..add('currentMemoryPost', currentMemoryPost)
          ..add('myPosts', myPosts))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState? _$v;

  PostBuilder? _currentMemoryPost;
  PostBuilder get currentMemoryPost =>
      _$this._currentMemoryPost ??= new PostBuilder();
  set currentMemoryPost(PostBuilder? currentMemoryPost) =>
      _$this._currentMemoryPost = currentMemoryPost;

  ListBuilder<Post>? _myPosts;
  ListBuilder<Post> get myPosts => _$this._myPosts ??= new ListBuilder<Post>();
  set myPosts(ListBuilder<Post>? myPosts) => _$this._myPosts = myPosts;

  AppStateBuilder();

  AppStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currentMemoryPost = $v.currentMemoryPost?.toBuilder();
      _myPosts = $v.myPosts.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppState build() => _build();

  _$AppState _build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              currentMemoryPost: _currentMemoryPost?.build(),
              myPosts: myPosts.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'currentMemoryPost';
        _currentMemoryPost?.build();
        _$failedField = 'myPosts';
        myPosts.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
