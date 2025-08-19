import 'package:flutter/material.dart';

import '../../features/home/view/home_screen.dart';


class AppRoutes{
  static const String homeRouteName = "HomeScreen";



  static Map<String,WidgetBuilder> routes = {
    homeRouteName: (context) =>  HomeScreen(),

  };
}