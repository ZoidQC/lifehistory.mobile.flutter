library life_history_mobile.models.authenticate_result;

import 'package:json_annotation/json_annotation.dart';

part 'authenticate_result.g.dart';

@JsonSerializable()
class AuthenticateResult extends Object with _$AuthenticateResultSerializerMixin {
  @JsonKey(name: 'authenticate_result')
  final int authenticateResult;

  AuthenticateResult({
    this.authenticateResult,
  });

  factory AuthenticateResult.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateResultFromJson(json);
}
