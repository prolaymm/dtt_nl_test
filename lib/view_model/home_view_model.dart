import 'package:d_tt_nl_code_test/core/services/api_result.dart';
import 'package:d_tt_nl_code_test/core/services/api_status.dart';
import 'package:d_tt_nl_code_test/core/vos/house_vos.dart';
import 'package:d_tt_nl_code_test/data/repo/impl/house_repo_impl.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  RxList<HouseVo> mHouseList = RxList();

  final _houseRepo = HouseRepoImpl();

  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString message = "".obs;



  @override
  void onInit() {
    fetchHouseDataFromServer();
    super.onInit();
  }

  fetchHouseDataFromServer() async {
    isLoading.value = true;
    isError.value = false;
    message.value = "";
    try {
      ApiResult<List<HouseVo>> apiResult = await _houseRepo.getHouseList();

      if (apiResult.statusType == StatusType.eComplete) {
        mHouseList.value = apiResult.data;
        print(apiResult.data);

        isError.value = false;
        message.value = "Success";
      } else {
        isError.value = true;
        message.value = apiResult.message;
      }

      isLoading.value = false;
    } catch (error) {
      isLoading.value = false;
      isError.value = true;
      message.value = "Something gone Wrong with Server or Interner";
    }
  }
}
