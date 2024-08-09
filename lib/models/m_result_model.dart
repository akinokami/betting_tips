class MResultModel {
  dynamic id;
  bool? isDatePlaceholder;
  int? count;
  String? justDate;
  String? search;
  bool? isLeaguePlaceholder;
  String? leagueName;
  int? leagueId;
  String? img;
  String? name;
  String? gameId;
  String? date;
  String? homeTeam;
  String? awayTeam;
  String? homeGoals;
  String? awayGoals;
  String? league;
  String? time;
  String? status;
  bool? subscribed;
  String? gameOutcome;
  num? aiHome;
  num? aiAway;
  num? aiDraw;
  String? prediction;
  String? aiMsg;
  bool? risky;
  bool? aiCorrect;
  String? color;
  bool? hasAi;
  String? currentDate;
  bool? hideBuyMsg;
  String? buyMsg;

  MResultModel(
      {this.id,
      this.isDatePlaceholder,
      this.count,
      this.justDate,
      this.search,
      this.isLeaguePlaceholder,
      this.leagueName,
      this.leagueId,
      this.img,
      this.name,
      this.gameId,
      this.date,
      this.homeTeam,
      this.awayTeam,
      this.homeGoals,
      this.awayGoals,
      this.league,
      this.time,
      this.status,
      this.subscribed,
      this.gameOutcome,
      this.aiHome,
      this.aiAway,
      this.aiDraw,
      this.prediction,
      this.aiMsg,
      this.risky,
      this.aiCorrect,
      this.color,
      this.hasAi,
      this.currentDate,
      this.hideBuyMsg,
      this.buyMsg});

  MResultModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isDatePlaceholder = json['isDatePlaceholder'];
    count = json['count'];
    justDate = json['justDate'];
    search = json['search'];
    isLeaguePlaceholder = json['isLeaguePlaceholder'];
    leagueName = json['LeagueName'];
    leagueId = json['LeagueId'];
    img = json['img'];
    name = json['name'];
    gameId = json['gameId'];
    date = json['date'];
    homeTeam = json['HomeTeam'];
    awayTeam = json['AwayTeam'];
    homeGoals = json['HomeGoals'];
    awayGoals = json['AwayGoals'];
    league = json['League'];
    time = json['Time'];
    status = json['Status'];
    subscribed = json['subscribed'];
    gameOutcome = json['gameOutcome'];
    aiHome = json['AiHome'];
    aiAway = json['AiAway'];
    aiDraw = json['AiDraw'];
    prediction = json['prediction'];
    aiMsg = json['aiMsg'];
    risky = json['risky'];
    aiCorrect = json['AiCorrect'];
    color = json['color'];
    hasAi = json['hasAi'];
    currentDate = json['currentDate'];
    hideBuyMsg = json['hideBuyMsg'];
    buyMsg = json['buyMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isDatePlaceholder'] = isDatePlaceholder;
    data['count'] = count;
    data['justDate'] = justDate;
    data['search'] = search;
    data['isLeaguePlaceholder'] = isLeaguePlaceholder;
    data['LeagueName'] = leagueName;
    data['LeagueId'] = leagueId;
    data['img'] = img;
    data['name'] = name;
    data['gameId'] = gameId;
    data['date'] = date;
    data['HomeTeam'] = homeTeam;
    data['AwayTeam'] = awayTeam;
    data['HomeGoals'] = homeGoals;
    data['AwayGoals'] = awayGoals;
    data['League'] = league;
    data['Time'] = time;
    data['Status'] = status;
    data['subscribed'] = subscribed;
    data['gameOutcome'] = gameOutcome;
    data['AiHome'] = aiHome;
    data['AiAway'] = aiAway;
    data['AiDraw'] = aiDraw;
    data['prediction'] = prediction;
    data['aiMsg'] = aiMsg;
    data['risky'] = risky;
    data['AiCorrect'] = aiCorrect;
    data['color'] = color;
    data['hasAi'] = hasAi;
    data['currentDate'] = currentDate;
    data['hideBuyMsg'] = hideBuyMsg;
    data['buyMsg'] = buyMsg;
    return data;
  }
}
