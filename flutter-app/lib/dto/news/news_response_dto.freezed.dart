// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'news_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsResponseDto _$NewsResponseDtoFromJson(Map<String, dynamic> json) {
  return _NewsResponseDto.fromJson(json);
}

/// @nodoc
mixin _$NewsResponseDto {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;
  List<String> get likeUserIdList => throw _privateConstructorUsedError;
  List<CommentDto> get commentList => throw _privateConstructorUsedError;
  int get createDate => throw _privateConstructorUsedError;
  List<String> get imagesUrl => throw _privateConstructorUsedError;
  String get reviewId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsResponseDtoCopyWith<NewsResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsResponseDtoCopyWith<$Res> {
  factory $NewsResponseDtoCopyWith(
          NewsResponseDto value, $Res Function(NewsResponseDto) then) =
      _$NewsResponseDtoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String userId,
      int type,
      String caption,
      List<String> likeUserIdList,
      List<CommentDto> commentList,
      int createDate,
      List<String> imagesUrl,
      String reviewId});
}

/// @nodoc
class _$NewsResponseDtoCopyWithImpl<$Res>
    implements $NewsResponseDtoCopyWith<$Res> {
  _$NewsResponseDtoCopyWithImpl(this._value, this._then);

  final NewsResponseDto _value;
  // ignore: unused_field
  final $Res Function(NewsResponseDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? type = freezed,
    Object? caption = freezed,
    Object? likeUserIdList = freezed,
    Object? commentList = freezed,
    Object? createDate = freezed,
    Object? imagesUrl = freezed,
    Object? reviewId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      likeUserIdList: likeUserIdList == freezed
          ? _value.likeUserIdList
          : likeUserIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      commentList: commentList == freezed
          ? _value.commentList
          : commentList // ignore: cast_nullable_to_non_nullable
              as List<CommentDto>,
      createDate: createDate == freezed
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as int,
      imagesUrl: imagesUrl == freezed
          ? _value.imagesUrl
          : imagesUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
      reviewId: reviewId == freezed
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_NewsResponseDtoCopyWith<$Res>
    implements $NewsResponseDtoCopyWith<$Res> {
  factory _$$_NewsResponseDtoCopyWith(
          _$_NewsResponseDto value, $Res Function(_$_NewsResponseDto) then) =
      __$$_NewsResponseDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String userId,
      int type,
      String caption,
      List<String> likeUserIdList,
      List<CommentDto> commentList,
      int createDate,
      List<String> imagesUrl,
      String reviewId});
}

/// @nodoc
class __$$_NewsResponseDtoCopyWithImpl<$Res>
    extends _$NewsResponseDtoCopyWithImpl<$Res>
    implements _$$_NewsResponseDtoCopyWith<$Res> {
  __$$_NewsResponseDtoCopyWithImpl(
      _$_NewsResponseDto _value, $Res Function(_$_NewsResponseDto) _then)
      : super(_value, (v) => _then(v as _$_NewsResponseDto));

  @override
  _$_NewsResponseDto get _value => super._value as _$_NewsResponseDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? type = freezed,
    Object? caption = freezed,
    Object? likeUserIdList = freezed,
    Object? commentList = freezed,
    Object? createDate = freezed,
    Object? imagesUrl = freezed,
    Object? reviewId = freezed,
  }) {
    return _then(_$_NewsResponseDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      likeUserIdList: likeUserIdList == freezed
          ? _value._likeUserIdList
          : likeUserIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      commentList: commentList == freezed
          ? _value._commentList
          : commentList // ignore: cast_nullable_to_non_nullable
              as List<CommentDto>,
      createDate: createDate == freezed
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as int,
      imagesUrl: imagesUrl == freezed
          ? _value._imagesUrl
          : imagesUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
      reviewId: reviewId == freezed
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewsResponseDto implements _NewsResponseDto {
  _$_NewsResponseDto(
      {required this.id,
      required this.userId,
      required this.type,
      required this.caption,
      required final List<String> likeUserIdList,
      required final List<CommentDto> commentList,
      required this.createDate,
      required final List<String> imagesUrl,
      required this.reviewId})
      : _likeUserIdList = likeUserIdList,
        _commentList = commentList,
        _imagesUrl = imagesUrl;

  factory _$_NewsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$$_NewsResponseDtoFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final int type;
  @override
  final String caption;
  final List<String> _likeUserIdList;
  @override
  List<String> get likeUserIdList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likeUserIdList);
  }

  final List<CommentDto> _commentList;
  @override
  List<CommentDto> get commentList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commentList);
  }

  @override
  final int createDate;
  final List<String> _imagesUrl;
  @override
  List<String> get imagesUrl {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagesUrl);
  }

  @override
  final String reviewId;

  @override
  String toString() {
    return 'NewsResponseDto(id: $id, userId: $userId, type: $type, caption: $caption, likeUserIdList: $likeUserIdList, commentList: $commentList, createDate: $createDate, imagesUrl: $imagesUrl, reviewId: $reviewId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsResponseDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.caption, caption) &&
            const DeepCollectionEquality()
                .equals(other._likeUserIdList, _likeUserIdList) &&
            const DeepCollectionEquality()
                .equals(other._commentList, _commentList) &&
            const DeepCollectionEquality()
                .equals(other.createDate, createDate) &&
            const DeepCollectionEquality()
                .equals(other._imagesUrl, _imagesUrl) &&
            const DeepCollectionEquality().equals(other.reviewId, reviewId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(caption),
      const DeepCollectionEquality().hash(_likeUserIdList),
      const DeepCollectionEquality().hash(_commentList),
      const DeepCollectionEquality().hash(createDate),
      const DeepCollectionEquality().hash(_imagesUrl),
      const DeepCollectionEquality().hash(reviewId));

  @JsonKey(ignore: true)
  @override
  _$$_NewsResponseDtoCopyWith<_$_NewsResponseDto> get copyWith =>
      __$$_NewsResponseDtoCopyWithImpl<_$_NewsResponseDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsResponseDtoToJson(this);
  }
}

abstract class _NewsResponseDto implements NewsResponseDto {
  factory _NewsResponseDto(
      {required final String id,
      required final String userId,
      required final int type,
      required final String caption,
      required final List<String> likeUserIdList,
      required final List<CommentDto> commentList,
      required final int createDate,
      required final List<String> imagesUrl,
      required final String reviewId}) = _$_NewsResponseDto;

  factory _NewsResponseDto.fromJson(Map<String, dynamic> json) =
      _$_NewsResponseDto.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  int get type => throw _privateConstructorUsedError;
  @override
  String get caption => throw _privateConstructorUsedError;
  @override
  List<String> get likeUserIdList => throw _privateConstructorUsedError;
  @override
  List<CommentDto> get commentList => throw _privateConstructorUsedError;
  @override
  int get createDate => throw _privateConstructorUsedError;
  @override
  List<String> get imagesUrl => throw _privateConstructorUsedError;
  @override
  String get reviewId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NewsResponseDtoCopyWith<_$_NewsResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}
