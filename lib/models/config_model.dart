class ConfigModel {
  bool? isApiCall;
  String? uId;
  String? cookie;

  ConfigModel({this.isApiCall, this.uId, this.cookie});

  ConfigModel.fromJson(Map<String, dynamic> json) {
    isApiCall = json['isApiCall'];
    uId = json['uId'];
    cookie = json['cookie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isApiCall'] = isApiCall;
    data['uId'] = uId;
    data['cookie'] = cookie;
    return data;
  }
}
