import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:flutter/foundation.dart';
import 'package:it_matrimony/core/constant/api_base.dart';

class ApiServices {
  late http.Client httpClient;

  ApiServices() {
    httpClient = _createProxiedClient();
  }

  http.Client _createProxiedClient() {
    final proxy = Platform.isAndroid
        ? '10.10.14.94:9090'
        : 'localhost:9090';

    HttpClient httpClient = HttpClient();

    httpClient.findProxy = (uri) {
      return "PROXY $proxy;";
    };
    
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;

    return IOClient(httpClient);
  }

  Future<dynamic> getResponse(String endpoint) async {
    final url = Uri.parse(ApiBaseUrl.baseUrl + endpoint);

    const header = {
      'Content-Type': 'application/json',
    };

    try {
      final response = await httpClient.get(url, headers: header);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        debugPrint("Status Code: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}