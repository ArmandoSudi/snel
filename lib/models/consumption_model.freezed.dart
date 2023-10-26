// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consumption_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Consumption _$ConsumptionFromJson(Map<String, dynamic> json) {
  return _Consumption.fromJson(json);
}

/// @nodoc
mixin _$Consumption {
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'counter_id')
  String get counterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_id')
  String? get invoiceId => throw _privateConstructorUsedError;
  double get power => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsumptionCopyWith<Consumption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsumptionCopyWith<$Res> {
  factory $ConsumptionCopyWith(
          Consumption value, $Res Function(Consumption) then) =
      _$ConsumptionCopyWithImpl<$Res, Consumption>;
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) String? id,
      @JsonKey(name: 'counter_id') String counterId,
      @JsonKey(name: 'invoice_id') String? invoiceId,
      double power,
      String unit});
}

/// @nodoc
class _$ConsumptionCopyWithImpl<$Res, $Val extends Consumption>
    implements $ConsumptionCopyWith<$Res> {
  _$ConsumptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? counterId = null,
    Object? invoiceId = freezed,
    Object? power = null,
    Object? unit = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      counterId: null == counterId
          ? _value.counterId
          : counterId // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceId: freezed == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String?,
      power: null == power
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsumptionImplCopyWith<$Res>
    implements $ConsumptionCopyWith<$Res> {
  factory _$$ConsumptionImplCopyWith(
          _$ConsumptionImpl value, $Res Function(_$ConsumptionImpl) then) =
      __$$ConsumptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) String? id,
      @JsonKey(name: 'counter_id') String counterId,
      @JsonKey(name: 'invoice_id') String? invoiceId,
      double power,
      String unit});
}

/// @nodoc
class __$$ConsumptionImplCopyWithImpl<$Res>
    extends _$ConsumptionCopyWithImpl<$Res, _$ConsumptionImpl>
    implements _$$ConsumptionImplCopyWith<$Res> {
  __$$ConsumptionImplCopyWithImpl(
      _$ConsumptionImpl _value, $Res Function(_$ConsumptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? counterId = null,
    Object? invoiceId = freezed,
    Object? power = null,
    Object? unit = null,
  }) {
    return _then(_$ConsumptionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      counterId: null == counterId
          ? _value.counterId
          : counterId // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceId: freezed == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String?,
      power: null == power
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsumptionImpl implements _Consumption {
  const _$ConsumptionImpl(
      {@JsonKey(includeFromJson: false, includeToJson: false) this.id,
      @JsonKey(name: 'counter_id') required this.counterId,
      @JsonKey(name: 'invoice_id') this.invoiceId,
      required this.power,
      required this.unit});

  factory _$ConsumptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsumptionImplFromJson(json);

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? id;
  @override
  @JsonKey(name: 'counter_id')
  final String counterId;
  @override
  @JsonKey(name: 'invoice_id')
  final String? invoiceId;
  @override
  final double power;
  @override
  final String unit;

  @override
  String toString() {
    return 'Consumption(id: $id, counterId: $counterId, invoiceId: $invoiceId, power: $power, unit: $unit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsumptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.counterId, counterId) ||
                other.counterId == counterId) &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.power, power) || other.power == power) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, counterId, invoiceId, power, unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsumptionImplCopyWith<_$ConsumptionImpl> get copyWith =>
      __$$ConsumptionImplCopyWithImpl<_$ConsumptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsumptionImplToJson(
      this,
    );
  }
}

abstract class _Consumption implements Consumption {
  const factory _Consumption(
      {@JsonKey(includeFromJson: false, includeToJson: false) final String? id,
      @JsonKey(name: 'counter_id') required final String counterId,
      @JsonKey(name: 'invoice_id') final String? invoiceId,
      required final double power,
      required final String unit}) = _$ConsumptionImpl;

  factory _Consumption.fromJson(Map<String, dynamic> json) =
      _$ConsumptionImpl.fromJson;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get id;
  @override
  @JsonKey(name: 'counter_id')
  String get counterId;
  @override
  @JsonKey(name: 'invoice_id')
  String? get invoiceId;
  @override
  double get power;
  @override
  String get unit;
  @override
  @JsonKey(ignore: true)
  _$$ConsumptionImplCopyWith<_$ConsumptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
