// Payment model with amount, counter, currency and date fields
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:snel/models/timestamp_serializer.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

@Freezed()
class Payment with _$Payment {
  const factory Payment({
    required int amount,
    required String counter,
    required String currency,
    @TimestampSerializer() required DateTime date,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);
}
