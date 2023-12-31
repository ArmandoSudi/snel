// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Counter _$CounterFromJson(Map<String, dynamic> json) {
  return _Counter.fromJson(json);
}

/// @nodoc
mixin _$Counter {
  @JsonKey(includeFromJson: false, includeToJson: true)
  String? get id => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_id')
  String get clientId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CounterCopyWith<Counter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterCopyWith<$Res> {
  factory $CounterCopyWith(Counter value, $Res Function(Counter) then) =
      _$CounterCopyWithImpl<$Res, Counter>;
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: true) String? id,
      String address,
      String category,
      @JsonKey(name: 'client_id') String clientId});
}

/// @nodoc
class _$CounterCopyWithImpl<$Res, $Val extends Counter>
    implements $CounterCopyWith<$Res> {
  _$CounterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? address = null,
    Object? category = null,
    Object? clientId = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CounterImplCopyWith<$Res> implements $CounterCopyWith<$Res> {
  factory _$$CounterImplCopyWith(
          _$CounterImpl value, $Res Function(_$CounterImpl) then) =
      __$$CounterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: true) String? id,
      String address,
      String category,
      @JsonKey(name: 'client_id') String clientId});
}

/// @nodoc
class __$$CounterImplCopyWithImpl<$Res>
    extends _$CounterCopyWithImpl<$Res, _$CounterImpl>
    implements _$$CounterImplCopyWith<$Res> {
  __$$CounterImplCopyWithImpl(
      _$CounterImpl _value, $Res Function(_$CounterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? address = null,
    Object? category = null,
    Object? clientId = null,
  }) {
    return _then(_$CounterImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CounterImpl implements _Counter {
  const _$CounterImpl(
      {@JsonKey(includeFromJson: false, includeToJson: true) this.id,
      required this.address,
      required this.category,
      @JsonKey(name: 'client_id') required this.clientId});

  factory _$CounterImpl.fromJson(Map<String, dynamic> json) =>
      _$$CounterImplFromJson(json);

  @override
  @JsonKey(includeFromJson: false, includeToJson: true)
  final String? id;
  @override
  final String address;
  @override
  final String category;
  @override
  @JsonKey(name: 'client_id')
  final String clientId;

  @override
  String toString() {
    return 'Counter(id: $id, address: $address, category: $category, clientId: $clientId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, address, category, clientId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CounterImplCopyWith<_$CounterImpl> get copyWith =>
      __$$CounterImplCopyWithImpl<_$CounterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CounterImplToJson(
      this,
    );
  }
}

abstract class _Counter implements Counter {
  const factory _Counter(
      {@JsonKey(includeFromJson: false, includeToJson: true) final String? id,
      required final String address,
      required final String category,
      @JsonKey(name: 'client_id')
      required final String clientId}) = _$CounterImpl;

  factory _Counter.fromJson(Map<String, dynamic> json) = _$CounterImpl.fromJson;

  @override
  @JsonKey(includeFromJson: false, includeToJson: true)
  String? get id;
  @override
  String get address;
  @override
  String get category;
  @override
  @JsonKey(name: 'client_id')
  String get clientId;
  @override
  @JsonKey(ignore: true)
  _$$CounterImplCopyWith<_$CounterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
