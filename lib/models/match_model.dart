import 'package:intl/intl.dart';

class MatchModel {
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
  String? matchTime;
  String? homeTeam;
  String? awayTeam;
  String? league;
  String? time;
  String? status;
  num? aiHome;
  num? aiAway;
  num? aiDraw;
  String? prediction;
  String? aiMsg;
  bool? risky;
  String? aiAwayColor;
  String? aiDrawColor;
  String? aiHomeColor;
  bool? hasAi;
  bool? subscribed;
  bool? hideBuyMsg;
  String? buyMsg;

  MatchModel(
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
      this.matchTime,
      this.homeTeam,
      this.awayTeam,
      this.league,
      this.time,
      this.status,
      this.aiHome,
      this.aiAway,
      this.aiDraw,
      this.prediction,
      this.aiMsg,
      this.risky,
      this.aiAwayColor,
      this.aiDrawColor,
      this.aiHomeColor,
      this.hasAi,
      this.subscribed,
      this.hideBuyMsg,
      this.buyMsg});

  MatchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
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
    matchTime = json['date'] != null
        ? DateFormat("HH:mm").format(DateTime.parse(json['date']))
        : "";
    homeTeam = json['HomeTeam'];
    awayTeam = json['AwayTeam'];
    league = json['League'];
    time = json['Time'];
    status = json['Status'];
    aiHome = json['AiHome'];
    aiAway = json['AiAway'];
    aiDraw = json['AiDraw'];
    prediction = json['prediction'];
    aiMsg = json['aiMsg'];
    risky = json['risky'];
    aiAwayColor = json['AiAwayColor'];
    aiDrawColor = json['AiDrawColor'];
    aiHomeColor = json['AiHomeColor'];
    hasAi = json['hasAi'];
    subscribed = json['subscribed'];
    hideBuyMsg = json['hideBuyMsg'];
    buyMsg = json['buyMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isDatePlaceholder'] = isDatePlaceholder;
    data['count'] = count;
    data['justDate'] = justDate;
    // data['search'] = search;
    data['isLeaguePlaceholder'] = isLeaguePlaceholder;
    data['LeagueName'] = leagueName;
    data['LeagueId'] = leagueId;
    data['img'] = img;
    data['name'] = name;
    data['gameId'] = gameId;
    data['date'] = date;
    data['HomeTeam'] = homeTeam;
    data['AwayTeam'] = awayTeam;
    data['League'] = league;
    data['Time'] = time;
    data['Status'] = status;
    data['AiHome'] = aiHome;
    data['AiAway'] = aiAway;
    data['AiDraw'] = aiDraw;
    data['prediction'] = prediction;
    data['aiMsg'] = aiMsg;
    data['risky'] = risky;
    data['AiAwayColor'] = aiAwayColor;
    data['AiDrawColor'] = aiDrawColor;
    data['AiHomeColor'] = aiHomeColor;
    data['hasAi'] = hasAi;
    data['subscribed'] = subscribed;
    data['hideBuyMsg'] = hideBuyMsg;
    data['buyMsg'] = buyMsg;
    return data;
  }
}
