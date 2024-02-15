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

EventListModel _$EventListModelFromJson(Map<String, dynamic> json) {
  return _EventListModel.fromJson(json);
}

/// @nodoc
mixin _$EventListModel {
  @JsonKey(name: 'notificationList')
  List<EventDetailModel> get eventDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'page')
  PagenationModel get pagenation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventListModelCopyWith<EventListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventListModelCopyWith<$Res> {
  factory $EventListModelCopyWith(
          EventListModel value, $Res Function(EventListModel) then) =
      _$EventListModelCopyWithImpl<$Res, EventListModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'notificationList') List<EventDetailModel> eventDetails,
      @JsonKey(name: 'page') PagenationModel pagenation});

  $PagenationModelCopyWith<$Res> get pagenation;
}

/// @nodoc
class _$EventListModelCopyWithImpl<$Res, $Val extends EventListModel>
    implements $EventListModelCopyWith<$Res> {
  _$EventListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventDetails = null,
    Object? pagenation = null,
  }) {
    return _then(_value.copyWith(
      eventDetails: null == eventDetails
          ? _value.eventDetails
          : eventDetails // ignore: cast_nullable_to_non_nullable
              as List<EventDetailModel>,
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
abstract class _$$EventListModelImplCopyWith<$Res>
    implements $EventListModelCopyWith<$Res> {
  factory _$$EventListModelImplCopyWith(_$EventListModelImpl value,
          $Res Function(_$EventListModelImpl) then) =
      __$$EventListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'notificationList') List<EventDetailModel> eventDetails,
      @JsonKey(name: 'page') PagenationModel pagenation});

  @override
  $PagenationModelCopyWith<$Res> get pagenation;
}

/// @nodoc
class __$$EventListModelImplCopyWithImpl<$Res>
    extends _$EventListModelCopyWithImpl<$Res, _$EventListModelImpl>
    implements _$$EventListModelImplCopyWith<$Res> {
  __$$EventListModelImplCopyWithImpl(
      _$EventListModelImpl _value, $Res Function(_$EventListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventDetails = null,
    Object? pagenation = null,
  }) {
    return _then(_$EventListModelImpl(
      eventDetails: null == eventDetails
          ? _value._eventDetails
          : eventDetails // ignore: cast_nullable_to_non_nullable
              as List<EventDetailModel>,
      pagenation: null == pagenation
          ? _value.pagenation
          : pagenation // ignore: cast_nullable_to_non_nullable
              as PagenationModel,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$EventListModelImpl implements _EventListModel {
  _$EventListModelImpl(
      {@JsonKey(name: 'notificationList')
      required final List<EventDetailModel> eventDetails,
      @JsonKey(name: 'page') required this.pagenation})
      : _eventDetails = eventDetails;

  factory _$EventListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventListModelImplFromJson(json);

  final List<EventDetailModel> _eventDetails;
  @override
  @JsonKey(name: 'notificationList')
  List<EventDetailModel> get eventDetails {
    if (_eventDetails is EqualUnmodifiableListView) return _eventDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eventDetails);
  }

  @override
  @JsonKey(name: 'page')
  final PagenationModel pagenation;

  @override
  String toString() {
    return 'EventListModel(eventDetails: $eventDetails, pagenation: $pagenation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventListModelImpl &&
            const DeepCollectionEquality()
                .equals(other._eventDetails, _eventDetails) &&
            (identical(other.pagenation, pagenation) ||
                other.pagenation == pagenation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_eventDetails), pagenation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventListModelImplCopyWith<_$EventListModelImpl> get copyWith =>
      __$$EventListModelImplCopyWithImpl<_$EventListModelImpl>(
          this, _$identity);
}

abstract class _EventListModel implements EventListModel {
  factory _EventListModel(
          {@JsonKey(name: 'notificationList')
          required final List<EventDetailModel> eventDetails,
          @JsonKey(name: 'page') required final PagenationModel pagenation}) =
      _$EventListModelImpl;

  factory _EventListModel.fromJson(Map<String, dynamic> json) =
      _$EventListModelImpl.fromJson;

  @override
  @JsonKey(name: 'notificationList')
  List<EventDetailModel> get eventDetails;
  @override
  @JsonKey(name: 'page')
  PagenationModel get pagenation;
  @override
  @JsonKey(ignore: true)
  _$$EventListModelImplCopyWith<_$EventListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
