import 'package:e_commerce_app_ui/utils/app_routes.dart';
import 'package:e_commerce_app_ui/views/pages/bottom_navitor_bar_scren.dart';
import 'package:e_commerce_app_ui/views/pages/search_page.dart';


import 'package:flutter/material.dart';

import '../views/pages/onbording_screen.dart';
import '../views/pages/productDetailsPage.dart';

class AppRouter{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case AppRoutes.home:
      return MaterialPageRoute(
        builder: (_)=>const BottomNvigatorPage(),
        settings: settings
        );
      case AppRoutes.onbordingscreen:
      return MaterialPageRoute(
        builder: (_)=>const OnbordingScreen(),
        settings: settings
        );
        case AppRoutes.productDetailsPage:
        final int index=settings.arguments as int;
        return MaterialPageRoute(
          
          builder: (_)=> ProductDetailsPage(index: index),
          settings: settings
          );
        case AppRoutes.searchPage:
        return MaterialPageRoute(
          builder: (_)=>const SearchPage(),
          settings: settings
          );
        default:
        return MaterialPageRoute(
          builder: (_)=>const Center(child:Text("Error Page")),
          settings: settings
          );
    }
  }
}

