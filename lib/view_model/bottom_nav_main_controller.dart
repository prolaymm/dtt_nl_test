import 'package:get/get.dart';

class BottomNavMainController extends GetxController {
  RxInt index = 0.obs;


  void onNavigationChange(int currentIndex) {
    index.value = currentIndex;
  }
}