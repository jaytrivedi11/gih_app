import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:gih/form_screen.dart';
import 'package:gih/model/PoliceStationModel.dart';

import '../phone.dart';
import 'ApiConstant.dart';
import 'dart:developer';
import 'package:http/http.dart'as http;

class ApiService {
  Future getPoliceStation(String id) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.policstation+id);
      var response = await http.get(url,headers:   {

      });
      if (response.statusCode == 200) {

        return json.decode(response.body);

      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future sendFeedback(String name,String mobile,FirstQuestion q1,SecondQuestion q2,String feedback,int stars,String policestationID,String subdivisionID,String districtID) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.feedback);

      var body = jsonEncode(<String,dynamic>{

        "name":"jay triivedi",
        "mobile":"9898588335",
        "q1": 1,
        "q2": 1,
        "feedback":"jdjjdjkdjkjdkjsjdkks",
        "stars":3,
        "policestationID":"63356d02829140309235c28b",
        "subdivisionID":"6335697ed08f260516a6fbcd",
        "districtID":"63356975d08f260516a6fbcb",


      });


      var response = await http.post(url,body:body);
    print("jay : uper if"+body);
      print("jay : uper if"+"${response.request.}");
      print("jay : uper if"+url.toString());
      if (response.statusCode == 200) {
        print("jay here"+response.body);

        print(response.body.toString());

        return json.decode(response.body);

      }
    } catch (e) {
      print("error"+e.toString());
      log(e.toString());
    }
  }

 
  
}