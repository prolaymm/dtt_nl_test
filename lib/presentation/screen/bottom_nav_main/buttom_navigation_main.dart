
import 'package:d_tt_nl_code_test/presentation/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../view_model/bottom_nav_main_controller.dart';
import '../about_screen/about_screen.dart';
import 'build_bottom_item_bar.dart';

class BottomNavMain extends StatelessWidget {
  const BottomNavMain({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final navController = Get.find<BottomNavMainController>();

    return Obx(
          () => Scaffold(
        extendBody: true,
        body: IndexedStack(
          index: navController.index.value,
          children: const [
           HomeScreen(),
            AboutScreen()

          ],
        ),
        bottomNavigationBar: BuildBottomItemBar(
          bottomNavMainController: navController,
        ),
      ),
    );
  }
}