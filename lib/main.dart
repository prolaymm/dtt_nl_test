import 'package:d_tt_nl_code_test/presentation/route/app_route_name.dart';
import 'package:d_tt_nl_code_test/presentation/route/register_page_route.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'core/theme/app_theme.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
/*  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );*/
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      getPages: RegisterPageRoute().getPages,
     initialRoute: AppRouteName.rHome,

    );
  }
}

