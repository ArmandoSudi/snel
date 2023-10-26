import 'package:freezed_annotation/freezed_annotation.dart';

part 'consumption_model.freezed.dart';
part 'consumption_model.g.dart';

@Freezed()
class Consumption with _$Consumption {
  const factory Consumption({
    @JsonKey(includeFromJson: false, includeToJson: false) String? id,
    @JsonKey(name: 'counter_id')required String counterId,
    @JsonKey(name: 'invoice_id')String? invoiceId,
    required double power,
    required String unit,
  }) = _Consumption;

factory Consumption.fromJson(Map<String, dynamic> json) => _$ConsumptionFromJson(json);

}