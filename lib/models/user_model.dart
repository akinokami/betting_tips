class UserModel {
  bool? disable;
  // List<Null>? friendList;
  bool? subscribeToNews;
  bool? subscribeToEngagement;
  bool? subscribeToEmail;
  int? purchaseType;
  int? paymentState;
  bool? isVip;
  // List<Null>? dailyTippings;
  // List<Null>? purchasedTickets;
  bool? demoUsed;
  bool? isWeb;
  bool? usedFreeVip;
  bool? codeUsed;
  bool? isGuest;
  bool? appleUser;
  bool? googleUser;
  String? sId;
  String? username;
  String? password;
  String? email;
  String? myStatus;
  String? avatar;
  // List<Null>? friends;
  // List<Null>? incomingFriendRequests;
  // List<Null>? devices;
  String? createdAt;
  // List<Null>? blockedUsers;
  // List<Null>? blockedFrom;
  String? lastLogin;
  String? hash;
  String? salt;
  int? iV;

  UserModel(
      {this.disable,
      // this.friendList,
      this.subscribeToNews,
      this.subscribeToEngagement,
      this.subscribeToEmail,
      this.purchaseType,
      this.paymentState,
      this.isVip,
      // this.dailyTippings,
      // this.purchasedTickets,
      this.demoUsed,
      this.isWeb,
      this.usedFreeVip,
      this.codeUsed,
      this.isGuest,
      this.appleUser,
      this.googleUser,
      this.sId,
      this.username,
      this.password,
      this.email,
      this.myStatus,
      this.avatar,
      // this.friends,
      // this.incomingFriendRequests,
      // this.devices,
      this.createdAt,
      // this.blockedUsers,
      // this.blockedFrom,
      this.lastLogin,
      this.hash,
      this.salt,
      this.iV});

  UserModel.fromJson(Map<String, dynamic> json) {
    disable = json['disable'];
    // if (json['friendList'] != null) {
    //   friendList = <Null>[];
    //   json['friendList'].forEach((v) {
    //     friendList!.add(new Null.fromJson(v));
    //   });
    // }
    subscribeToNews = json['subscribeToNews'];
    subscribeToEngagement = json['subscribeToEngagement'];
    subscribeToEmail = json['subscribeToEmail'];
    purchaseType = json['purchaseType'];
    paymentState = json['paymentState'];
    isVip = json['isVip'];
    // if (json['dailyTippings'] != null) {
    //   dailyTippings = <Null>[];
    //   json['dailyTippings'].forEach((v) {
    //     dailyTippings!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['purchasedTickets'] != null) {
    //   purchasedTickets = <Null>[];
    //   json['purchasedTickets'].forEach((v) {
    //     purchasedTickets!.add(new Null.fromJson(v));
    //   });
    // }
    demoUsed = json['demoUsed'];
    isWeb = json['isWeb'];
    usedFreeVip = json['usedFreeVip'];
    codeUsed = json['codeUsed'];
    isGuest = json['isGuest'];
    appleUser = json['appleUser'];
    googleUser = json['googleUser'];
    sId = json['_id'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    myStatus = json['myStatus'];
    avatar = json['avatar'];
    // if (json['friends'] != null) {
    //   friends = <Null>[];
    //   json['friends'].forEach((v) {
    //     friends!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['incomingFriendRequests'] != null) {
    //   incomingFriendRequests = <Null>[];
    //   json['incomingFriendRequests'].forEach((v) {
    //     incomingFriendRequests!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['devices'] != null) {
    //   devices = <Null>[];
    //   json['devices'].forEach((v) {
    //     devices!.add(new Null.fromJson(v));
    //   });
    // }
    // createdAt = json['CreatedAt'];
    // if (json['blockedUsers'] != null) {
    //   blockedUsers = <Null>[];
    //   json['blockedUsers'].forEach((v) {
    //     blockedUsers!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['blockedFrom'] != null) {
    //   blockedFrom = <Null>[];
    //   json['blockedFrom'].forEach((v) {
    //     blockedFrom!.add(new Null.fromJson(v));
    //   });
    // }
    lastLogin = json['lastLogin'];
    hash = json['hash'];
    salt = json['salt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['disable'] = disable;
    // if (this.friendList != null) {
    //   data['friendList'] = this.friendList!.map((v) => v.toJson()).toList();
    // }
    data['subscribeToNews'] = subscribeToNews;
    data['subscribeToEngagement'] = subscribeToEngagement;
    data['subscribeToEmail'] = subscribeToEmail;
    data['purchaseType'] = purchaseType;
    data['paymentState'] = paymentState;
    data['isVip'] = isVip;
    // if (this.dailyTippings != null) {
    //   data['dailyTippings'] =
    //       this.dailyTippings!.map((v) => v.toJson()).toList();
    // }
    // if (this.purchasedTickets != null) {
    //   data['purchasedTickets'] =
    //       this.purchasedTickets!.map((v) => v.toJson()).toList();
    // }
    data['demoUsed'] = demoUsed;
    data['isWeb'] = isWeb;
    data['usedFreeVip'] = usedFreeVip;
    data['codeUsed'] = codeUsed;
    data['isGuest'] = isGuest;
    data['appleUser'] = appleUser;
    data['googleUser'] = googleUser;
    data['_id'] = sId;
    data['username'] = username;
    data['password'] = password;
    data['email'] = email;
    data['myStatus'] = myStatus;
    data['avatar'] = avatar;
    // if (this.friends != null) {
    //   data['friends'] = this.friends!.map((v) => v.toJson()).toList();
    // }
    // if (this.incomingFriendRequests != null) {
    //   data['incomingFriendRequests'] =
    //       this.incomingFriendRequests!.map((v) => v.toJson()).toList();
    // }
    // if (this.devices != null) {
    //   data['devices'] = this.devices!.map((v) => v.toJson()).toList();
    // }
    data['CreatedAt'] = createdAt;
    // if (this.blockedUsers != null) {
    //   data['blockedUsers'] = this.blockedUsers!.map((v) => v.toJson()).toList();
    // }
    // if (this.blockedFrom != null) {
    //   data['blockedFrom'] = this.blockedFrom!.map((v) => v.toJson()).toList();
    // }
    data['lastLogin'] = lastLogin;
    data['hash'] = hash;
    data['salt'] = salt;
    data['__v'] = iV;
    return data;
  }
}
