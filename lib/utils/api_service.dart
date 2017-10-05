import 'dart:async';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:life_history_mobile/models/authenticate_result.dart';
import 'package:life_history_mobile/models/day.dart';
import 'package:life_history_mobile/models/login_request.dart';
import 'package:life_history_mobile/utils/request_assistant.dart';

class ApiService {
  static const _apiUrl = "https://lifehistory.ca:5000/api/";

  static String _getFullUrl(String urlPart) {
    return "$_apiUrl$urlPart";
  }

  static Future<bool> login(String username, String password) async {
    LoginRequest loginRequest =
        new LoginRequest(username: username, password: password);

    final requestResponse = await RequestAssistant.executeRequest(
        HttpMethod.post, _getFullUrl("authenticate"), loginRequest.toJson());

    if (requestResponse.statusCode == 200) {
      final authenticateResult =
          new AuthenticateResult.fromJson(requestResponse.data);
      return authenticateResult.authenticateResult == 1;
    }

    return false;
  }

  static Future<Day> getDay(DateTime date) async {
    assert(date != null);

    final DateFormat dateTimeFormatter = new DateFormat('yyyy-MM-dd');
    final getUrl = "${_getFullUrl("days")}/${dateTimeFormatter.format(date)}";

    final requestResponse = await RequestAssistant.executeRequest(
        HttpMethod.get, getUrl, null, credentials: new HttpClientBasicCredentials("test_account", "test1234"));

    if (requestResponse.statusCode == 200) {
      return new Day.fromJson(requestResponse.data);
    }

    return null;
  }
}
