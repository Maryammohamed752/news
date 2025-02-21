import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app_two/core/routes/app_routes.dart';
import 'package:news_app_two/moduels/home/home_view.dart';
import 'package:news_app_two/moduels/search/search_view.dart';
import 'package:news_app_two/moduels/splash/splash_view.dart';
import 'package:news_app_two/providers/app_language_provider.dart';
import 'package:news_app_two/providers/app_theme_provider.dart';
import 'package:news_app_two/theme/app_theme.dart';
import 'package:provider/provider.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AppLanguageProvider()),
    ChangeNotifierProvider(create: (context) => AppThemeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      routes: {
        HomeView.routeName: (context) => HomeView(),
        SearchView.routeName: (context) => SearchView(),
      },
      navigatorKey: navigatorKey,
      onGenerateRoute: AppRoutes.onGeneratedRoute,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
      locale: Locale(languageProvider.appLanguage),
    );
  }
}
