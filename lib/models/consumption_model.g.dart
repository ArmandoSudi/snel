// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumption_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsumptionImpl _$$ConsumptionImplFromJson(Map<String, dynamic> json) =>
    _$ConsumptionImpl(
      counterId: json['counter_id'] as String,
      invoiceId: json['invoice_id'] as String?,
      power: (json['power'] as num).toDouble(),
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$$ConsumptionImplToJson(_$ConsumptionImpl instance) =>
    <String, dynamic>{
      'counter_id': instance.counterId,
      'invoice_id': instance.invoiceId,
      'power': instance.power,
      'unit': instance.unit,
    };
