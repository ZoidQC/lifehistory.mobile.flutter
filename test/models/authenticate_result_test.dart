import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:life_history_mobile/models/authenticate_result.dart';

main() {
  test('JSON deserialization works for AuthenticateResult', () {
    var json = """
    {
      "authenticate_result": 1
    }
    """;
    var jsonMap = JSON.decode(json);
    var model = new AuthenticateResult.fromJson(jsonMap);

    expect(model.authenticateResult, 1);
  });
}
