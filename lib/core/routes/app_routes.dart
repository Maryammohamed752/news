import 'package:flutter/material.dart';
import 'package:news_app_two/core/routes/pages_route_name.dart';
import 'package:news_app_two/moduels/home/home_view.dart';
import 'package:news_app_two/moduels/splash/splash_view.dart';

abstract class AppRoutes {
  static Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRouteName.initial:
        {
          return MaterialPageRoute(
            builder: (context) => const SplashView(),
            settings: settings,
          );
        }

      default:
        {
          return MaterialPageRoute(
            builder: (context) => HomeView(),
            settings: settings,
          );
        }
    }
  }
}
