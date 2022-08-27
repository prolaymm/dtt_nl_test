import 'package:get/get.dart';

import '../../di/home_binding.dart';
import '../screen/home_screen/home_screen.dart';
import 'app_route_name.dart';


class RegisterPageRoute {

  var getPages = [
    GetPage(name: AppRouteName.rHome, page: ()=> const HomeScreen(),binding: HomeBinding()),

  ];
}