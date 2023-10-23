import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_model.freezed.dart';
part 'counter_model.g.dart';

@Freezed()
class Counter with _$Counter {
  const factory Counter({
    @JsonKey(includeFromJson: false, includeToJson: true) String? id,
    required String address,
    required String category,
    @JsonKey(name: 'client_id') required String clientId,
  }) = _Counter;

  factory Counter.newEmpty({required String userId}) => Counter(
      id: null, address: '', category: '', clientId: '');

  factory Counter.fromJson(Map<String, dynamic> json) => _$CounterFromJson(json);

  factory Counter.fromDocument(DocumentSnapshot doc) {
    if (doc.data() == null) throw Exception("Document data was null");

    return Counter.fromJson(doc.data() as Map<String, Object?>).copyWith(id: doc.id);
  }
}