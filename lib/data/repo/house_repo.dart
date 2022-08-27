import 'package:d_tt_nl_code_test/core/vos/house_vos.dart';

import '../../core/services/api_result.dart';

abstract class HouseRepo {

  Future<ApiResult<List<HouseVo>>>  getHouseList();
}