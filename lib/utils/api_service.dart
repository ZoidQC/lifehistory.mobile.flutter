import 'dart:async';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:life_history_mobile/models/activity.dart';
import 'package:life_history_mobile/models/activity_type.dart';
import 'package:life_history_mobile/models/authenticate_result.dart';
import 'package:life_history_mobile/models/day.dart';
import 'package:life_history_mobile/models/login_request.dart';
import 'package:life_history_mobile/utils/credentials_manager.dart';
import 'package:life_history_mobile/utils/request_assistant.dart';

class ApiService {
  static const _apiUrl = "https://lifehistory.ca:5000/api/";

  static String _getFullUrl(String urlPart) {
    return "$_apiUrl$urlPart";
  }

  final CredentialProvider credentialProvider;

  ApiService(this.credentialProvider);

  Future<bool> login(String username, String password) async {
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

  Future<Day> getDayWithDate(DateTime date) async {
    return _getDay(date: date);
  }

  Future<Day> getDayWithId(int id) async {
    return _getDay(dayId: id);
  }

  Future<Day> _getDay({DateTime date, int dayId}) async {
    assert(date != null || dayId != null);

    var urlParameter;

    if (date != null) {
      final DateFormat dateTimeFormatter = new DateFormat('yyyy-MM-dd');
      urlParameter = dateTimeFormatter.format(date);
    } else {
      urlParameter = dayId.toString();
    }

    final getUrl = "${_getFullUrl("days")}/$urlParameter";

    Credential credential = await credentialProvider.getCredential();
    final requestResponse = await RequestAssistant.executeRequest(
        HttpMethod.get, getUrl, null,
        credentials: new HttpClientBasicCredentials(
            credential.username, credential.password));

    if (requestResponse.statusCode == 200) {
      return new Day.fromJson(requestResponse.data);
    }

    return null;
  }

  Future<List<ActivityType>> getActivityTypes() async {
    Credential credential = await credentialProvider.getCredential();
    final requestResponse = await RequestAssistant.executeRequest(
        HttpMethod.get, _getFullUrl("activity_types"), null,
        credentials: new HttpClientBasicCredentials(
            credential.username, credential.password));

    if (requestResponse.statusCode == 200) {
      return (requestResponse.data as List)
          .map((e) => e == null
              ? null
              : new ActivityType.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return null;
  }

  Future<ActivityType> getActivityType(int activityTypeId) async {
    final getUrl = "${_getFullUrl("activity_types")}/$activityTypeId";

    Credential credential = await credentialProvider.getCredential();
    final requestResponse = await RequestAssistant.executeRequest(
        HttpMethod.get, getUrl, null,
        credentials: new HttpClientBasicCredentials(
            credential.username, credential.password));

    if (requestResponse.statusCode == 200) {
      return new ActivityType.fromJson(requestResponse.data);
    }

    return null;
  }

  Future<List<Activity>> getActivities() async {
    Credential credential = await credentialProvider.getCredential();
    final requestResponse = await RequestAssistant.executeRequest(
        HttpMethod.get, _getFullUrl("activities"), null,
        credentials: new HttpClientBasicCredentials(
            credential.username, credential.password));

    if (requestResponse.statusCode == 200) {
      return (requestResponse.data as List)
          .map((e) => e == null
          ? null
          : new Activity.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return null;
  }

  Future<Activity> getActivity(int activityId) async {
    final getUrl = "${_getFullUrl("activities")}/$activityId";

    Credential credential = await credentialProvider.getCredential();
    final requestResponse = await RequestAssistant.executeRequest(
        HttpMethod.get, getUrl, null,
        credentials: new HttpClientBasicCredentials(
            credential.username, credential.password));

    if (requestResponse.statusCode == 200) {
      return new Activity.fromJson(requestResponse.data);
    }

    return null;
  }
}
