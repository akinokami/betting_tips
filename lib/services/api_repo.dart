import 'dart:convert';

import 'package:betting_tips/models/m_result_model.dart';
import 'package:betting_tips/models/match_model.dart';
import 'package:betting_tips/models/other_model.dart';
import 'package:betting_tips/models/sport_date.dart';
import 'package:betting_tips/models/user_model.dart';
import 'package:betting_tips/services/api_constant.dart';
import 'package:betting_tips/services/api_utils.dart';
import 'package:get_storage/get_storage.dart';

import '../models/config_model.dart';
import '../utils/custom_exception.dart';

class ApiRepo {
  final ApiUtils apiUtils = ApiUtils();

  Future<UserModel> getGuestUser() async {
    try {
      final response =
          await apiUtils.get(url: "${ApiConstant.baseUrl}getGuest");
      final cookies = response.headers['set-cookie'];
      if ((cookies ?? []).isNotEmpty) {
        final box = GetStorage();
        box.write('cookies', cookies?[0].toString());
        apiUtils.setCookies(cookies?[0] ?? '');
      }
      print("cookies>>>${cookies?[0].toString()}");
      final guest = response.data;
      return UserModel.fromJson(guest);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<List<MatchModel>> getUpcomingList() async {
    try {
      final response =
          await apiUtils.post(url: "${ApiConstant.baseUrl}upcoming/0");
      print("response >>>>>$response");
      final matches = response.data as List;
      return matches.map((item) => MatchModel.fromJson(item)).toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<List<MResultModel>> getFinishList() async {
    try {
      final response =
          await apiUtils.post(url: "${ApiConstant.baseUrl}finished");
      final matches = response.data as List;
      return matches.map((item) => MResultModel.fromJson(item)).toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<List<MatchModel>> getLiveList(String uId) async {
    try {
      final response = await apiUtils.post(
          url: "${ApiConstant.baseUrl}getLiveChannels/$uId/0/40");
      final lives = response.data as List;
      return lives.map((item) => MatchModel.fromJson(item)).toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<ConfigModel> getConfig() async {
    try {
      final response = await apiUtils.get(url: ApiConstant.configUrl);
      return ConfigModel.fromJson(response.data);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  ///Other Sport
  ///Basketball
  Future<List<OtherModel>> getBasketTodayList() async {
    try {
      final response = await apiUtils.get(
          url: "${ApiConstant.baseOsUrl}bahis_kodkey_betclic_today/basket");
      final btList = jsonDecode(response.data) as List;
      return btList.map((item) => OtherModel.fromJson(item)).toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<List<SportDate>> getBasketDateList() async {
    try {
      final response = await apiUtils.get(
          url: "${ApiConstant.baseOsUrl}bahis_kodkey_betclic_dates/basket");
      final sdList = jsonDecode(response.data) as List;
      return sdList.map((item) => SportDate.fromJson(item)).toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<List<OtherModel>> getBasketHistoryList(String date) async {
    try {
      final response = await apiUtils.get(
          url:
              "${ApiConstant.baseOsUrl}bahis_kodkey_betclic_date/basket/$date");
      final btList = jsonDecode(response.data) as List;
      return btList.map((item) => OtherModel.fromJson(item)).toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  ///Tennis
  Future<List<OtherModel>> getTennisTodayList() async {
    try {
      final response = await apiUtils.get(
          url: "${ApiConstant.baseOsUrl}bahis_kodkey_betclic_today/tenis");
      final btList = jsonDecode(response.data) as List;
      return btList.map((item) => OtherModel.fromJson(item)).toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<List<SportDate>> getTennisDateList() async {
    try {
      final response = await apiUtils.get(
          url: "${ApiConstant.baseOsUrl}bahis_kodkey_betclic_dates/tenis");
      final sdList = jsonDecode(response.data) as List;
      return sdList.map((item) => SportDate.fromJson(item)).toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<List<OtherModel>> getTennisHistoryList(String date) async {
    try {
      final response = await apiUtils.get(
          url: "${ApiConstant.baseOsUrl}bahis_kodkey_betclic_date/tenis/$date");
      final btList = jsonDecode(response.data) as List;
      return btList.map((item) => OtherModel.fromJson(item)).toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
}
