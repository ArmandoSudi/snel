import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_model.g.dart';
part 'client_model.freezed.dart';

@Freezed()
class Client with _$Client{
  const factory Client({
    required String name,
    required String sexe,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    required List<String> compteurs,
}) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}