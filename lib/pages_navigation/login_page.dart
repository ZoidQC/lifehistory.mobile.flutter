import 'package:flutter/material.dart';
import 'package:life_history_mobile/utils/api_service.dart';

class LoginPage extends StatelessWidget {
  _testHttpCall() {
    Map<String, String> data = new Map();
    data.putIfAbsent("username", () {
      return "test";
    });
    data.putIfAbsent("password", () {
      return "1234";
    });

    ApiService apiService = new ApiService();
    apiService
        .executeRequest(HttpMethod.post, "authenticate", data)
        .then((requestResponse) {
      Map test = requestResponse.data;
      final authenticateResult = test["authenticate_result"];

      if (authenticateResult == 1) {
        print("Yes!");
      } else {
        print("No :(");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _testHttpCall();

    return new Container(
      child: new Text(
        "Login",
      ),
    );
  }
}
