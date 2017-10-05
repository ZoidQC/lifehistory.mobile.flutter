library life_history_mobile.models.login_request;

import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest extends Object with _$LoginRequestSerializerMixin {
  final String username;
  final String password;

  LoginRequest({
    this.username,
    this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}
