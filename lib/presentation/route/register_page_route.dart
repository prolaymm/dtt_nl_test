import 'package:d_tt_nl_code_test/di/bottom_nav_main_binding.dart';
import 'package:d_tt_nl_code_test/presentation/screen/bottom_nav_main/buttom_navigation_main.dart';
import 'package:d_tt_nl_code_test/presentation/screen/house_detail_screen/house_detail_screen.dart';
import 'package:get/get.dart';

import '../../di/home_binding.dart';
import '../screen/home_screen/home_screen.dart';
import 'app_route_name.dart';


class RegisterPageRoute {

  var getPages = [
    GetPage(name: AppRouteName.rHome, page: ()=> const HomeScreen(),binding: HomeBinding()),
    GetPage(name: AppRouteName.rINITIAL, page: ()=> const BottomNavMain(),binding: BottomNavMainBinding()),
    GetPage(name: AppRouteName.rHouseDetail, page: ()=> const HouseDetailScreen()),

  ];
}