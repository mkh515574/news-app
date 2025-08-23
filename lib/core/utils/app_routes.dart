import 'package:flutter/material.dart';

import '../../features/home/view/home_screen.dart';
import '../../features/news/view/widgets/search_screen/search_screen.dart';


class AppRoutes{
  static const String homeRouteName = "HomeScreen";
  static const String searchRouteName = "SearchScreen";




  static Map<String,WidgetBuilder> routes = {
    homeRouteName: (context) =>  HomeScreen(),
    searchRouteName: (context) =>  SearchScreen(),

  };
}