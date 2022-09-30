import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:gih/model/PoliceStationModel.dart';

import '../phone.dart';
import 'ApiConstant.dart';
import 'dart:developer';
import 'package:http/http.dart'as http;

class ApiService {
  Future getUsers(String id) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint+id);
      var response = await http.get(url,headers:   {

      });
      if (response.statusCode == 200) {
        // Map<String, dynamic> map= jsonDecode(response.body) ;
        //
        // PoliceStationModel realdata = PoliceStationModel.fromJson(json.decode(response.body));





        return json.decode(response.body);

      }
    } catch (e) {
      log(e.toString());
    }
  }

 
  
}