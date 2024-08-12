class SportDate {
  String? macDate;

  SportDate({this.macDate});

  SportDate.fromJson(Map<String, dynamic> json) {
    macDate = json['mac_date'];
  }
}
