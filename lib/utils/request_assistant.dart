import 'dart:async';
import 'dart:convert';
import 'dart:io';

class HttpMethod {
  static const get = "get";
  static const post = "post";
  static const put = "put";
  static const delete = "delete";
  static const head = "head";
  static const patch = "patch";
}

class RequestResponse {
  RequestResponse(this.statusCode, this.data);

  final statusCode;
  final dynamic data;
}

class RequestAssistant {
  static const _jsonContentType = "application/json";

  static Future<RequestResponse> executeRequest(
      String method, String url, Map<String, String> data,
      {HttpClientBasicCredentials credentials}) async {
    HttpClient client = new HttpClient();
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;

    final uri = Uri.parse(url);
    final request = await client.openUrl(method, uri);

    if (credentials != null) {
      client.addCredentials(uri, null, credentials);
    }

    if (data != null) {
      request.headers.add(HttpHeaders.CONTENT_TYPE, _jsonContentType);
      request.write(JSON.encode(data));
    }

    print(
        "[ApiService] executeRequest Method ($method) Url ($url) Data($data) Authenticated (${credentials !=
            null})");

    final response = await request.close();
    dynamic responseData;

    await for (var contents in response.transform(UTF8.decoder)) {
      print("[ApiService] response statusCode (${response
          .statusCode}) contents ($contents)");

      if (response.headers.contentType.value == _jsonContentType) {
        responseData = JSON.decode(contents);
      }
    }

    return new RequestResponse(response.statusCode, responseData);
  }
}
