import 'dart:convert';

class PoliceStationModel {
  String? policestationID;
  String? policestationName;
  String? subdivisionID;
  String? districtID;

  PoliceStationModel(
      {this.policestationID,
        this.policestationName,
        this.subdivisionID,
        this.districtID});


  factory PoliceStationModel.fromJson(Map<String, dynamic> json) {
    return PoliceStationModel(
      policestationID: json['policestationID'] as String,
      policestationName: json['policestationName']as String,
      subdivisionID: json['subdivisionID']as String,
      districtID: json['districtID']as String,
    );
  }

}
