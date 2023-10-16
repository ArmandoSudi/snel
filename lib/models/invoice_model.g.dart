// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceImpl _$$InvoiceImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceImpl(
      amount: json['amount'] as String,
      counter: json['counter'] as String,
      currency: json['currency'] as String,
      isPaid: json['is_paid'] as bool,
      period: json['period'] as String,
    );

Map<String, dynamic> _$$InvoiceImplToJson(_$InvoiceImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'counter': instance.counter,
      'currency': instance.currency,
      'is_paid': instance.isPaid,
      'period': instance.period,
    };
