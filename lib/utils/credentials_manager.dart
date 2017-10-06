import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class CredentialProvider {
  Future<Credential> getCredential();
}

class SharedPreferencesCredentialProvider implements CredentialProvider {
  Future<Credential> getCredential() async {
    return await CredentialsManager.getCredential();
  }
}

class Credential {
  String username;
  String password;

  Credential(this.username, this.password);

  Credential.fromEncodedValue(String encodedValue) {
    final decodedValue = new Base64Decoder().convert(encodedValue).toString();
    final splitValues = decodedValue.split(':');
    assert(splitValues.length == 2);

    this.username = splitValues[0];
    this.password = splitValues[1];
  }

  get base64Encoded {
    return new Base64Encoder().convert("$username:$password".codeUnits);
  }
}

class CredentialsManager {
  static const _credentialKey = "life_history_credentials";

  static Future storeCredential(Credential credential) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_credentialKey, credential.base64Encoded);
  }

  static Future<Credential> getCredential() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final savedValue = sharedPreferences.getString(_credentialKey);

    if (savedValue != null) {
      return new Credential.fromEncodedValue(savedValue);
    }

    return null;
  }
}
