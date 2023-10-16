// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentImpl _$$PaymentImplFromJson(Map<String, dynamic> json) =>
    _$PaymentImpl(
      amount: json['amount'] as int,
      counter: json['counter'] as String,
      currency: json['currency'] as String,
      date: const TimestampSerializer().fromJson(json['date'] as Timestamp),
    );

Map<String, dynamic> _$$PaymentImplToJson(_$PaymentImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'counter': instance.counter,
      'currency': instance.currency,
      'date': const TimestampSerializer().toJson(instance.date),
    };
