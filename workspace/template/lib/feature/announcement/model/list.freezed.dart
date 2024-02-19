// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnnouncementListModel _$AnnouncementListModelFromJson(
    Map<String, dynamic> json) {
  return _AnnouncementListModel.fromJson(json);
}

/// @nodoc
mixin _$AnnouncementListModel {
  @JsonKey(name: 'notificationList')
  List<AnnouncementDetailModel> get announcementDetails =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'page')
  PagenationModel get pagenation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnouncementListModelCopyWith<AnnouncementListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementListModelCopyWith<$Res> {
  factory $AnnouncementListModelCopyWith(AnnouncementListModel value,
          $Res Function(AnnouncementListModel) then) =
      _$AnnouncementListModelCopyWithImpl<$Res, AnnouncementListModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'notificationList')
      List<AnnouncementDetailModel> announcementDetails,
      @JsonKey(name: 'page') PagenationModel pagenation});

  $PagenationModelCopyWith<$Res> get pagenation;
}

/// @nodoc
class _$AnnouncementListModelCopyWithImpl<$Res,
        $Val extends AnnouncementListModel>
    implements $AnnouncementListModelCopyWith<$Res> {
  _$AnnouncementListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? announcementDetails = null,
    Object? pagenation = null,
  }) {
    return _then(_value.copyWith(
      announcementDetails: null == announcementDetails
          ? _value.announcementDetails
          : announcementDetails // ignore: cast_nullable_to_non_nullable
              as List<AnnouncementDetailModel>,
      pagenation: null == pagenation
          ? _value.pagenation
          : pagenation // ignore: cast_nullable_to_non_nullable
              as PagenationModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PagenationModelCopyWith<$Res> get pagenation {
    return $PagenationModelCopyWith<$Res>(_value.pagenation, (value) {
      return _then(_value.copyWith(pagenation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnnouncementListModelImplCopyWith<$Res>
    implements $AnnouncementListModelCopyWith<$Res> {
  factory _$$AnnouncementListModelImplCopyWith(
          _$AnnouncementListModelImpl value,
          $Res Function(_$AnnouncementListModelImpl) then) =
      __$$AnnouncementListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'notificationList')
      List<AnnouncementDetailModel> announcementDetails,
      @JsonKey(name: 'page') PagenationModel pagenation});

  @override
  $PagenationModelCopyWith<$Res> get pagenation;
}

/// @nodoc
class __$$AnnouncementListModelImplCopyWithImpl<$Res>
    extends _$AnnouncementListModelCopyWithImpl<$Res,
        _$AnnouncementListModelImpl>
    implements _$$AnnouncementListModelImplCopyWith<$Res> {
  __$$AnnouncementListModelImplCopyWithImpl(_$AnnouncementListModelImpl _value,
      $Res Function(_$AnnouncementListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? announcementDetails = null,
    Object? pagenation = null,
  }) {
    return _then(_$AnnouncementListModelImpl(
      announcementDetails: null == announcementDetails
          ? _value._announcementDetails
          : announcementDetails // ignore: cast_nullable_to_non_nullable
              as List<AnnouncementDetailModel>,
      pagenation: null == pagenation
          ? _value.pagenation
          : pagenation // ignore: cast_nullable_to_non_nullable
              as PagenationModel,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$AnnouncementListModelImpl implements _AnnouncementListModel {
  _$AnnouncementListModelImpl(
      {@JsonKey(name: 'notificationList')
      required final List<AnnouncementDetailModel> announcementDetails,
      @JsonKey(name: 'page') required this.pagenation})
      : _announcementDetails = announcementDetails;

  factory _$AnnouncementListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnnouncementListModelImplFromJson(json);

  final List<AnnouncementDetailModel> _announcementDetails;
  @override
  @JsonKey(name: 'notificationList')
  List<AnnouncementDetailModel> get announcementDetails {
    if (_announcementDetails is EqualUnmodifiableListView)
      return _announcementDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_announcementDetails);
  }

  @override
  @JsonKey(name: 'page')
  final PagenationModel pagenation;

  @override
  String toString() {
    return 'AnnouncementListModel(announcementDetails: $announcementDetails, pagenation: $pagenation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnouncementListModelImpl &&
            const DeepCollectionEquality()
                .equals(other._announcementDetails, _announcementDetails) &&
            (identical(other.pagenation, pagenation) ||
                other.pagenation == pagenation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_announcementDetails), pagenation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnouncementListModelImplCopyWith<_$AnnouncementListModelImpl>
      get copyWith => __$$AnnouncementListModelImplCopyWithImpl<
          _$AnnouncementListModelImpl>(this, _$identity);
}

abstract class _AnnouncementListModel implements AnnouncementListModel {
  factory _AnnouncementListModel(
          {@JsonKey(name: 'notificationList')
          required final List<AnnouncementDetailModel> announcementDetails,
          @JsonKey(name: 'page') required final PagenationModel pagenation}) =
      _$AnnouncementListModelImpl;

  factory _AnnouncementListModel.fromJson(Map<String, dynamic> json) =
      _$AnnouncementListModelImpl.fromJson;

  @override
  @JsonKey(name: 'notificationList')
  List<AnnouncementDetailModel> get announcementDetails;
  @override
  @JsonKey(name: 'page')
  PagenationModel get pagenation;
  @override
  @JsonKey(ignore: true)
  _$$AnnouncementListModelImplCopyWith<_$AnnouncementListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
