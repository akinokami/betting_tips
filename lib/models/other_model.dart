import 'package:get/get.dart';

class OtherModel {
  String? macId;
  String? macEvent;
  String? macDate;
  String? macHome;
  String? macAway;
  num? mac1y;
  num? macxy;
  num? mac2y;
  // String? macOy;
  // String? macUy;
  // String? macH1y;
  // String? macH2y;

  OtherModel({
    this.macId,
    this.macEvent,
    this.macDate,
    this.macHome,
    this.macAway,
    this.mac1y,
    this.macxy,
    this.mac2y,
    // this.macOy,
    // this.macUy,
    // this.macH1y,
    // this.macH2y
  });

  OtherModel.fromJson(Map<String, dynamic> json) {
    macId = json['mac_id'];
    macEvent = json['mac_event'];
    macDate = json['mac_date'];
    macHome = json['mac_home'];
    macAway = json['mac_away'];
    mac1y = json['mac_1y'] != "" ? num.parse(json['mac_1y']) : 0;
    macxy = json['mac_xy'] != "" && json['mac_xy'] != null
        ? num.parse(json["mac_xy"])
        : 0;
    mac2y = json['mac_2y'] != "" ? num.parse(json['mac_2y']) : 0;
    // macOy = json['mac_oy'];
    // macUy = json['mac_uy'];
    // macH1y = json['mac_h1y'];
    // macH2y = json['mac_h2y'];
  }
}
