// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagenation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PagenationModel _$PagenationModelFromJson(Map<String, dynamic> json) {
  return _PagenationModel.fromJson(json);
}

/// @nodoc
mixin _$PagenationModel {
  @JsonKey(name: 'totalPages')
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalElements')
  int get totalElements => throw _privateConstructorUsedError;
  @JsonKey(name: 'pageNumber')
  int get pageNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemSize')
  int get pageSize => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PagenationModelCopyWith<PagenationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagenationModelCopyWith<$Res> {
  factory $PagenationModelCopyWith(
          PagenationModel value, $Res Function(PagenationModel) then) =
      _$PagenationModelCopyWithImpl<$Res, PagenationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'totalPages') int totalPages,
      @JsonKey(name: 'totalElements') int totalElements,
      @JsonKey(name: 'pageNumber') int pageNumber,
      @JsonKey(name: 'itemSize') int pageSize});
}

/// @nodoc
class _$PagenationModelCopyWithImpl<$Res, $Val extends PagenationModel>
    implements $PagenationModelCopyWith<$Res> {
  _$PagenationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPages = null,
    Object? totalElements = null,
    Object? pageNumber = null,
    Object? pageSize = null,
  }) {
    return _then(_value.copyWith(
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalElements: null == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PagenationModelImplCopyWith<$Res>
    implements $PagenationModelCopyWith<$Res> {
  factory _$$PagenationModelImplCopyWith(_$PagenationModelImpl value,
          $Res Function(_$PagenationModelImpl) then) =
      __$$PagenationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'totalPages') int totalPages,
      @JsonKey(name: 'totalElements') int totalElements,
      @JsonKey(name: 'pageNumber') int pageNumber,
      @JsonKey(name: 'itemSize') int pageSize});
}

/// @nodoc
class __$$PagenationModelImplCopyWithImpl<$Res>
    extends _$PagenationModelCopyWithImpl<$Res, _$PagenationModelImpl>
    implements _$$PagenationModelImplCopyWith<$Res> {
  __$$PagenationModelImplCopyWithImpl(
      _$PagenationModelImpl _value, $Res Function(_$PagenationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPages = null,
    Object? totalElements = null,
    Object? pageNumber = null,
    Object? pageSize = null,
  }) {
    return _then(_$PagenationModelImpl(
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalElements: null == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$PagenationModelImpl implements _PagenationModel {
  _$PagenationModelImpl(
      {@JsonKey(name: 'totalPages') required this.totalPages,
      @JsonKey(name: 'totalElements') required this.totalElements,
      @JsonKey(name: 'pageNumber') required this.pageNumber,
      @JsonKey(name: 'itemSize') required this.pageSize});

  factory _$PagenationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PagenationModelImplFromJson(json);

  @override
  @JsonKey(name: 'totalPages')
  final int totalPages;
  @override
  @JsonKey(name: 'totalElements')
  final int totalElements;
  @override
  @JsonKey(name: 'pageNumber')
  final int pageNumber;
  @override
  @JsonKey(name: 'itemSize')
  final int pageSize;

  @override
  String toString() {
    return 'PagenationModel(totalPages: $totalPages, totalElements: $totalElements, pageNumber: $pageNumber, pageSize: $pageSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PagenationModelImpl &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalElements, totalElements) ||
                other.totalElements == totalElements) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalPages, totalElements, pageNumber, pageSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PagenationModelImplCopyWith<_$PagenationModelImpl> get copyWith =>
      __$$PagenationModelImplCopyWithImpl<_$PagenationModelImpl>(
          this, _$identity);
}

abstract class _PagenationModel implements PagenationModel {
  factory _PagenationModel(
          {@JsonKey(name: 'totalPages') required final int totalPages,
          @JsonKey(name: 'totalElements') required final int totalElements,
          @JsonKey(name: 'pageNumber') required final int pageNumber,
          @JsonKey(name: 'itemSize') required final int pageSize}) =
      _$PagenationModelImpl;

  factory _PagenationModel.fromJson(Map<String, dynamic> json) =
      _$PagenationModelImpl.fromJson;

  @override
  @JsonKey(name: 'totalPages')
  int get totalPages;
  @override
  @JsonKey(name: 'totalElements')
  int get totalElements;
  @override
  @JsonKey(name: 'pageNumber')
  int get pageNumber;
  @override
  @JsonKey(name: 'itemSize')
  int get pageSize;
  @override
  @JsonKey(ignore: true)
  _$$PagenationModelImplCopyWith<_$PagenationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
