import 'package:d_tt_nl_code_test/utils/dimens.dart';
import 'package:flutter/material.dart';

import '../../../view_model/bottom_nav_main_controller.dart';

class BuildBottomItemBar extends StatelessWidget {
  final BottomNavMainController bottomNavMainController;

  const BuildBottomItemBar({Key? key, required this.bottomNavMainController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: bottomNavMainController.index.value,
      selectedFontSize: k14Font,
      selectedItemColor: Theme.of(context).colorScheme.onPrimary,
      unselectedItemColor: Theme.of(context).hintColor,
      unselectedFontSize: k14Font,
      selectedLabelStyle: TextStyle(
        color: Theme.of(context).primaryColor,
      ),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 28,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      onTap: (int currentIndex) =>
          bottomNavMainController.onNavigationChange(currentIndex),
      items: [
        buildItem(
            index: 0,
            icon: Icons.home,
            title: "Home",
            context: context,
            bottomNavMainController: bottomNavMainController),
        buildItem(
            index: 1,
            icon: Icons.error_outlined,
            title: "Service",
            context: context,
            bottomNavMainController: bottomNavMainController),
      ],
    );
  }
}

BottomNavigationBarItem buildItem(
    {required int index,
    required context,
    required IconData icon,
    customIcon,
    required String title,
    required BottomNavMainController bottomNavMainController}) {
  return BottomNavigationBarItem(icon: Icon(icon), label: title);
}
