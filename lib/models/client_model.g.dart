// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientImpl _$$ClientImplFromJson(Map<String, dynamic> json) => _$ClientImpl(
      name: json['name'] as String,
      sexe: json['sexe'] as String,
      phoneNumber: json['phone_number'] as String,
      compteurs: (json['compteurs'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$ClientImplToJson(_$ClientImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'sexe': instance.sexe,
      'phone_number': instance.phoneNumber,
      'compteurs': instance.compteurs,
    };
