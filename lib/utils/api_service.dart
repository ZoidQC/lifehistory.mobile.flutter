import 'dart:async';

import 'package:life_history_mobile/models/authenticate_result.dart';
import 'package:life_history_mobile/models/login_request.dart';
import 'package:life_history_mobile/utils/request_assistant.dart';

class ApiService {
  static Future<bool> login(String username, String password) async {
    LoginRequest loginRequest =
        new LoginRequest(username: username, password: password);

    final requestResponse = await RequestAssistant.executeRequest(
        HttpMethod.post, "authenticate", loginRequest.toJson());

    if (requestResponse.statusCode == 200) {
      final authenticateResult =
          new AuthenticateResult.fromJson(requestResponse.data);
      return authenticateResult.authenticateResult == 1;
    }

    return false;
  }
}
