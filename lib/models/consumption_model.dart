import 'package:freezed_annotation/freezed_annotation.dart';

part 'consumption_model.freezed.dart';
part 'consumption_model.g.dart';

@Freezed()
class Consumption with _$Consumption {
  const factory Consumption({
    required String name,
    required String sexe,
    required String phone,
  }) = _Consumption;

factory Consumption.fromJson(Map<String, dynamic> json) => _$ConsumptionFromJson(json);

}