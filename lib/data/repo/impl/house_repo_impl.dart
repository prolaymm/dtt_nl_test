import 'dart:convert';

import 'package:d_tt_nl_code_test/core/services/api_result.dart';
import 'package:d_tt_nl_code_test/core/services/api_service.dart';
import 'package:d_tt_nl_code_test/core/vos/house_vos.dart';
import 'package:d_tt_nl_code_test/data/repo/house_repo.dart';
import 'package:d_tt_nl_code_test/utils/api_route.dart';

import '../../../core/services/api_status.dart';

class HouseRepoImpl extends HouseRepo {
  final ApiService _apiService = ApiService();

  ///fetch house list from server
  @override
  Future<ApiResult<List<HouseVo>>> getHouseList() async {
    try {
      dynamic response =
          await _apiService.getData(url: apiHouse, isHeader: true);
      print(response.body);

      if (response.statusCode == 200) {
        return ApiResult(
            message: "Success",
            statusType: StatusType.eComplete,
            data:houseVoFromJson(response.body));
      } else {
        Map message = jsonDecode(response.body);
        return ApiResult(
            message: message["error_description"],
            statusType: StatusType.eError,
            data: []);
      }
    } catch (error) {

      return ApiResult(
          message: "Something gone wrong with inter or server",
          statusType: StatusType.eError,
          data: []);
    }
  }
}
