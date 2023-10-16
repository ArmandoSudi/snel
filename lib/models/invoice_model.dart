import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_model.freezed.dart';
part 'invoice_model.g.dart';

@Freezed()
class Invoice with _$Invoice {
  const factory Invoice({
    required String amount,
    required String counter,
    required String currency,
    @JsonKey(name: 'is_paid') required bool isPaid,
    required String period,
  }) = _Invoice;

  factory Invoice.fromJson(Map<String, dynamic> json) => _$InvoiceFromJson(json);
}