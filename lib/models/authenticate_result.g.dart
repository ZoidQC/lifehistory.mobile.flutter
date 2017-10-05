// GENERATED CODE - DO NOT MODIFY BY HAND

part of life_history_mobile.models.authenticate_result;

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

AuthenticateResult _$AuthenticateResultFromJson(Map<String, dynamic> json) =>
    new AuthenticateResult(
        authenticateResult: json['authenticate_result'] as int);

abstract class _$AuthenticateResultSerializerMixin {
  int get authenticateResult;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'authenticate_result': authenticateResult};
}
