import 'dart:async';

import 'package:life_history_mobile/utils/api_service.dart';
import 'package:life_history_mobile/utils/credentials_manager.dart';
import 'package:test/test.dart';

class TestCredentialProvider implements CredentialProvider {
  Future<Credential> getCredential() async {
    return new Future.value(new Credential("test_account", "test1234"));
  }
}

main() {
  final apiService = new ApiService(new TestCredentialProvider());

  test('login works', () async {
    var isLoginSuccessful = await apiService.login("test_account", "test1234");
    expect(isLoginSuccessful, true);

    isLoginSuccessful = await apiService.login("bad_account", "bad1234");
    expect(isLoginSuccessful, false);
  });

  test('getDay works', () async {
    var day = await apiService.getDayWithDate(new DateTime(2017, 10, 5));
    expect(day.date, new DateTime(2017, 10, 5));

    day = await apiService.getDayWithId(day.id);
    expect(day.date, new DateTime(2017, 10, 5));

    day = await apiService.getDayWithDate(new DateTime(2017, 10, 4));
    expect(day, null);
  });

  test('getActivityTypes works', () async {
    var activityTypes = await apiService.getActivityTypes();
    expect(activityTypes.length, 1);
    expect(activityTypes[0].name, "test_category_1");
  });

  test('getActivities works', () async {
    var activityTypes = await apiService.getActivities();
    expect(activityTypes.length, 1);
    expect(activityTypes[0].name, "test_activity_1");
  });

  test('getActivityTypes works', () async {
    var activityType = await apiService.getActivityType(12);
    expect(activityType.name, "test_category_1");
  });

  test('getActivities works', () async {
    var activity = await apiService.getActivity(1448);
    expect(activity.name, "test_activity_1");
  });
}
