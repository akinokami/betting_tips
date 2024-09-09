class ApiConfigModel {
  bool? showOneDayFreePromo;
  bool? showOneDayFreePromo2;
  bool? showDayPromo;
  int? freePromoLength;
  int? promoCounter;
  int? promoCounterLimit;
  bool? showOldPackages;
  int? occurrence;
  bool? showDisco;
  bool? showCode;
  bool? showRate;
  bool? showInvite;
  bool? showChristmas;
  bool? showChristmas2;
  String? saleEndsString;
  bool? showCheap;
  bool? showCheap2;
  bool? isVip;

  ApiConfigModel(
      {this.showOneDayFreePromo,
      this.showOneDayFreePromo2,
      this.showDayPromo,
      this.freePromoLength,
      this.promoCounter,
      this.promoCounterLimit,
      this.showOldPackages,
      this.occurrence,
      this.showDisco,
      this.showCode,
      this.showRate,
      this.showInvite,
      this.showChristmas,
      this.showChristmas2,
      this.saleEndsString,
      this.showCheap,
      this.showCheap2,
      this.isVip});

  ApiConfigModel.fromJson(Map<String, dynamic> json) {
    showOneDayFreePromo = json['showOneDayFreePromo'];
    showOneDayFreePromo2 = json['showOneDayFreePromo2'];
    showDayPromo = json['showDayPromo'];
    freePromoLength = json['freePromoLength'];
    promoCounter = json['promoCounter'];
    promoCounterLimit = json['promoCounterLimit'];
    showOldPackages = json['showOldPackages'];
    occurrence = json['occurrence'];
    showDisco = json['showDisco'];
    showCode = json['showCode'];
    showRate = json['showRate'];
    showInvite = json['showInvite'];
    showChristmas = json['showChristmas'];
    showChristmas2 = json['showChristmas2'];
    saleEndsString = json['saleEndsString'];
    showCheap = json['showCheap'];
    showCheap2 = json['showCheap2'];
    isVip = json['isVip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['showOneDayFreePromo'] = showOneDayFreePromo;
    data['showOneDayFreePromo2'] = showOneDayFreePromo2;
    data['showDayPromo'] = showDayPromo;
    data['freePromoLength'] = freePromoLength;
    data['promoCounter'] = promoCounter;
    data['promoCounterLimit'] = promoCounterLimit;
    data['showOldPackages'] = showOldPackages;
    data['occurrence'] = occurrence;
    data['showDisco'] = showDisco;
    data['showCode'] = showCode;
    data['showRate'] = showRate;
    data['showInvite'] = showInvite;
    data['showChristmas'] = showChristmas;
    data['showChristmas2'] = showChristmas2;
    data['saleEndsString'] = saleEndsString;
    data['showCheap'] = showCheap;
    data['showCheap2'] = showCheap2;
    data['isVip'] = isVip;
    return data;
  }
}
