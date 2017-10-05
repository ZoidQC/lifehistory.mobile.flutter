import 'package:life_history_mobile/utils/api_service.dart';
import 'package:test/test.dart';

main() {
  test('login works', () async {
    var isLoginSuccessful = await ApiService.login("test_account", "test1234");
    expect(isLoginSuccessful, true);

    isLoginSuccessful = await ApiService.login("bad_account", "bad1234");
    expect(isLoginSuccessful, false);
  });

  test('getDay works', () async {
    var day = await ApiService.getDay(new DateTime(2017, 10, 5));
    expect(day.date, new DateTime(2017, 10, 5));

    day = await ApiService.getDay(new DateTime(2017, 10, 4));
    expect(day, null);
  });
}
