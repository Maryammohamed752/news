import 'package:flutter/material.dart';
import 'package:news_app_two/core/constants/app_assets.dart';

class SplashView extends StatefulWidget {
  static const String routeName = 'splash_view';

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: (Image.asset(AppAssets.logo)),
      ),
    );
  }
}
