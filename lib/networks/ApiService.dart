import 'dart:convert';
import 'package:gih/form_screen.dart';
import 'ApiConstant.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiService {
  Future getPoliceStation(String id) async {
    try {
      var url =
          Uri.parse(ApiConstants.baseUrl + ApiConstants.policstation + id);
      var response = await http.get(url, headers: {});
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  getQ1(FirstQuestion q1) {
    var index = {
      FirstQuestion.a: 0,
      FirstQuestion.b: 1,
      FirstQuestion.c: 2,
    };
    return index[q1];
  }

  getQ2(SecondQuestion q2) {
    var index = {
      SecondQuestion.a: 0,
      SecondQuestion.b: 1,
      SecondQuestion.c: 2,
      SecondQuestion.d: 3,
      SecondQuestion.e: 4,
    };
    return index[q2];
  }

  Future<bool> sendFeedback(
      String name,
      String mobile,
      FirstQuestion q1,
      SecondQuestion q2,
      String feedback,
      int stars,
      String policestationID,
      String subdivisionID,
      String districtID) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.feedback);

      var body = {
        "name": name,
        "mobile": mobile,
        "q1": getQ1(q1),
        "q2": getQ2(q2),
        "feedback": feedback,
        "stars": stars,
        "policestationID": policestationID,
        "subdivisionID": subdivisionID,
        "districtID": districtID,
      };

      var response = await http.post(
        url,
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        Map res = jsonDecode(response.body);
        if (res.containsKey("success")) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
