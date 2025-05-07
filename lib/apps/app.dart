import 'package:flutter/material.dart';
import 'package:whats_app_page/common/colors.dart';
import 'package:whats_app_page/pages/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Whats App",
      theme: ThemeData(
        scaffoldBackgroundColor:IColors.black,
        primaryColor: IColors.tealGreenDark,
      ),
      home: HomeView(),
    );
  }
}