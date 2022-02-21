import 'package:coco_app/logic/explorer_model.dart';
import 'package:coco_app/presentation/pages/explorer/explorer_page.dart';
import 'package:coco_app/presentation/pages/splash/splash_page.dart';
import 'package:coco_app/services/navigation_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'constants/colors.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ExplorerModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Coco Explorer',
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: AppColors.primaryColor,
          appBarTheme: const AppBarTheme(
            color: AppColors.appBarColor,
            iconTheme: IconThemeData(
              color: AppColors.appBarLeadingIconColor,
              opacity: 1,
            ),
          ),
          primaryTextTheme: const TextTheme(
            headline1: TextStyle(
              color: AppColors.h1TextColor,
            ),
          ),
          fontFamily: "Quicksand",
        ),
        routes: {
          NavigationRoutes.splash: (ctx) => const SplashPage(),
          NavigationRoutes.explorer: (context) => const ExplorerPage(),
        },
      );
    });
  }
}
