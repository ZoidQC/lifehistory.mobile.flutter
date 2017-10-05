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
  static const apiUrl = "https://lifehistory.ca:5000/api/";

  static Future<RequestResponse> executeRequest(
      String method, String partUrl, Map<String, String> data,
      {HttpClientBasicCredentials credentials}) async {
    HttpClient client = new HttpClient();
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;

    if (credentials != null) {
      client.addCredentials(Uri.parse(apiUrl), "", credentials);
    }

    String fullUrl = apiUrl + partUrl;
    final request = await client.openUrl(method, Uri.parse(fullUrl));

    if (data != null) {
      request.headers.add(HttpHeaders.CONTENT_TYPE, "application/json");
      request.write(JSON.encode(data));
    }

    print(
        "[ApiService] executeRequest Method ($method) Url ($fullUrl) Data($data) Authenticated (${credentials !=
            null})");

    final response = await request.close();
    dynamic responseData;

    await for (var contents in response.transform(UTF8.decoder)) {
      print("[ApiService] response statusCode (${response
          .statusCode}) contents ($contents)");

      responseData = JSON.decode(contents);
    }

    return new RequestResponse(response.statusCode, responseData);
  }
}
