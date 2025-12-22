// import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;
import 'package:it_matrimony/core/constant/api_base.dart';

class ApiServices {
  static final httpClient = http.Client();


  Future<dynamic> getResponse(String endpoint) async {
    final url = Uri.parse(ApiBaseUrl.baseUrl + endpoint);

    const header = {
      'Content-Type': 'application/json',
    };

    try {
      final respone = await httpClient.get(url, headers: header);
    if (respone.statusCode == 200){
      return respone.body;
    }
    }
    catch (e) {
      // print("error Response $e");
    }
    
  }
}


  // static final dio = Dio(
  //   BaseOptions(
  //     headers: {
  //     "Content-Type": "application/json",
  //     "Authorization": "Bearer your_token_here",
  //   },
  //   )
  // );