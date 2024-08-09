import 'package:betting_tips/models/m_result_model.dart';
import 'package:betting_tips/models/match_model.dart';
import 'package:betting_tips/models/user_model.dart';
import 'package:betting_tips/services/api_constant.dart';
import 'package:betting_tips/services/api_utils.dart';
import 'package:get_storage/get_storage.dart';

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
      print("response >>>>>$response");
      final matches = response.data as List;
      return matches.map((item) => MResultModel.fromJson(item)).toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
}
