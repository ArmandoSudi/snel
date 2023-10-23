import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_model.freezed.dart';
part 'invoice_model.g.dart';

@Freezed()
class Invoice with _$Invoice {

  const Invoice._();

  const factory Invoice({
    @JsonKey(includeFromJson: false, includeToJson: false) String? id,
    required int amount,
    @JsonKey(name: 'counter_id')required String counterId,
    required String currency,
    @JsonKey(name: 'is_paid') required bool isPaid,
    required String period,
  }) = _Invoice;

  factory Invoice.newEmpty({required String userId}) => Invoice(
    id: null, amount: 0, counterId: '', currency: '', isPaid: false, period: '' );

  factory Invoice.fromJson(Map<String, dynamic> json) => _$InvoiceFromJson(json);

  factory Invoice.fromDocument(DocumentSnapshot doc) {
    if (doc.data() == null) throw Exception("Document data was null");

    return Invoice.fromJson(doc.data() as Map<String, Object?>).copyWith(id: doc.id);
  }

}