import 'package:d_tt_nl_code_test/view_model/bottom_nav_main_controller.dart';
import 'package:d_tt_nl_code_test/view_model/home_view_model.dart';
import 'package:get/get.dart';

class BottomNavMainBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BottomNavMainController());
    Get.lazyPut(() => HomeViewModel());
  }

}