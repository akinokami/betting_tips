import 'package:betting_tips/models/match_model.dart';
import 'package:betting_tips/models/user_model.dart';
import 'package:betting_tips/services/api_constant.dart';
import 'package:betting_tips/services/api_utils.dart';

import '../utils/custom_exception.dart';

class ApiRepo {
  final ApiUtils apiUtils = ApiUtils();

  Future<UserModel> getGuestUser() async {
    try {
      final response =
          await apiUtils.get(url: "${ApiConstant.baseUrl}getGuest");
      final cookies = response.headers['set-cookie'];
      print("cookies>>>${cookies![0].toString()}");
      final guest = response.data;
      return UserModel.fromJson(guest);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<List<MatchModel>> getUpcomingList(seriesId) async {
    try {
      final response =
          await apiUtils.post(url: "${ApiConstant.baseUrl}upcoming/0");
      final matches = response.data as List;
      return matches.map((item) => MatchModel.fromJson(item)).toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
}
