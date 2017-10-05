// GENERATED CODE - DO NOT MODIFY BY HAND

part of life_history_mobile.models.login_request;

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) =>
    new LoginRequest(
        username: json['username'] as String,
        password: json['password'] as String);

abstract class _$LoginRequestSerializerMixin {
  String get username;
  String get password;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'username': username, 'password': password};
}
