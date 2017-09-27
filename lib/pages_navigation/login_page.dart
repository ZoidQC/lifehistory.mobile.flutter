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

    ApiService
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

    return new Form(
        child: new ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: <Widget>[
        new Container(
          child: new Image(
            image: const AssetImage('graphics/lh_logo.png'),
          ),
          height: 200.0,
          margin: const EdgeInsets.only(
            top: 40.0,
            bottom: 40.0,
          ),
        ),
        new TextFormField(
          decoration: const InputDecoration(
            icon: const Icon(Icons.email),
            hintText: 'What is your email/username?',
            labelText: 'Username',
          ),
        ),
        new TextFormField(
          decoration: const InputDecoration(
            icon: const Icon(Icons.lock),
            hintText: 'Enter your password here',
            labelText: 'Password',
          ),
          obscureText: true,
        ),
        new Container(
          padding: const EdgeInsets.all(20.0),
          alignment: const FractionalOffset(0.5, 0.5),
          child: new RaisedButton(
            child: const Text('LOG IN'),
            onPressed: null,
          ),
        ),
      ],
    ));
  }
}
