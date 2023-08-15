import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/global/binder_data.dart';
import 'app/resources/app_theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    title: "Movie Simple App",
    initialBinding: BinderData(),
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
    debugShowCheckedModeBanner: false,
    enableLog: true,
    unknownRoute: AppPages.routes.first,
    defaultTransition: Transition.rightToLeftWithFade,
    theme: getApplicationTheme(),
  ));
}
