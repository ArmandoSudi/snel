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
  String get name => throw _privateConstructorUsedError;
  String get sexe => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;

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
  $Res call({String name, String sexe, String phone});
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
    Object? name = null,
    Object? sexe = null,
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sexe: null == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
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
  $Res call({String name, String sexe, String phone});
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
    Object? name = null,
    Object? sexe = null,
    Object? phone = null,
  }) {
    return _then(_$ConsumptionImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sexe: null == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsumptionImpl implements _Consumption {
  const _$ConsumptionImpl(
      {required this.name, required this.sexe, required this.phone});

  factory _$ConsumptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsumptionImplFromJson(json);

  @override
  final String name;
  @override
  final String sexe;
  @override
  final String phone;

  @override
  String toString() {
    return 'Consumption(name: $name, sexe: $sexe, phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsumptionImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sexe, sexe) || other.sexe == sexe) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, sexe, phone);

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
      {required final String name,
      required final String sexe,
      required final String phone}) = _$ConsumptionImpl;

  factory _Consumption.fromJson(Map<String, dynamic> json) =
      _$ConsumptionImpl.fromJson;

  @override
  String get name;
  @override
  String get sexe;
  @override
  String get phone;
  @override
  @JsonKey(ignore: true)
  _$$ConsumptionImplCopyWith<_$ConsumptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
