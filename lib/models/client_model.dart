import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_model.g.dart';
part 'client_model.freezed.dart';

@Freezed()
class Client with _$Client{
  const factory Client({
    @JsonKey(includeFromJson: false, includeToJson: false) String? id,
    required String name,
    required String sexe,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    required List<Map<String, dynamic>> compteurs,
}) = _Client;

  factory Client.newEmpty({required String userId}) => Client(
      id: null, name: '', sexe: '', compteurs: [], phoneNumber: '');

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  factory Client.fromDocument(DocumentSnapshot doc) {
    if (doc.data() == null) throw Exception("Document data was null");

    return Client.fromJson(doc.data() as Map<String, Object?>).copyWith(id: doc.id);
  }
}