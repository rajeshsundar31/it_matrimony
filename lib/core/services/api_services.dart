import 'package:http/http.dart' as http;
import 'package:it_matrimony/core/constant/api_base.dart';

class ApiServices {
  static final httpClient = http.Client(); 
  static final ApiString = ApiBaseUrl();

  Future<dynamic> getResponse(String endpoint, String? id) async{
    var url = Uri.parse(ApiBaseUrl.baseUrl + endpoint);

    const header = {
      'Content-Type': 'application/json',
    };


    final respone = await httpClient.get(url, headers: header);
    if (respone.statusCode == 200){
      return respone;
    }
    

  }
}