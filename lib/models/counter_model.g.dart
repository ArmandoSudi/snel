// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CounterImpl _$$CounterImplFromJson(Map<String, dynamic> json) =>
    _$CounterImpl(
      address: json['address'] as String,
      category: json['category'] as String,
      clientId: json['client_id'] as String,
    );

Map<String, dynamic> _$$CounterImplToJson(_$CounterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'category': instance.category,
      'client_id': instance.clientId,
    };
