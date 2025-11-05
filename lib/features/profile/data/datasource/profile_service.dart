import 'dart:convert';

import 'package:it_matrimony/core/services/api_services.dart';
import 'package:it_matrimony/features/profile/data/model/mobilemodel.dart';

abstract class ProfileService {
  Future<dynamic> getProfileDetails(String endpoint);
}


class ProfileServiceImpl extends ProfileService {

  @override
  Future<dynamic> getProfileDetails(endpoints) async {
    try{
       final response = await ApiServices().getResponse(endpoints);

    if (response.statusCode == 200){
      var result = json.decode(response.body);
      return MobileModel.fromJson(result);
    }
    }
    catch (e) {
      // print("Issue is $e");
    }
   
  }
}