import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_model.g.dart';
part 'agent_model.freezed.dart';

@Freezed()
class Agent with _$Agent {
  const factory Agent({
    required String name,
    required String sexe,
    required String phone,
}) = _Agent;

  factory Agent.fromJson(Map<String, dynamic> json) => _$AgentFromJson(json);

  // factory Agent.fromJsonString(String jsonString) =>
  //     _$AgentFromJson(json.decode(jsonString));
}