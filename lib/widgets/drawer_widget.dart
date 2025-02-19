import 'package:flutter/material.dart';
import 'package:news_app_two/core/constants/app_assets.dart';
import 'package:news_app_two/core/constants/app_style.dart';
import 'package:news_app_two/providers/app_language_provider.dart';
import 'package:news_app_two/providers/app_theme_provider.dart';

import 'package:news_app_two/theme/color_palette.dart';
import 'package:news_app_two/widgets/drawer_items.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app_two/widgets/language_bottom_sheet.dart';
import 'package:news_app_two/widgets/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  Function onDrawerItemClicked;

  DrawerWidget({required this.onDrawerItemClicked});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var mediaQuery = MediaQuery.of(context);
    return Container(
      width: mediaQuery.size.width * 0.65,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: mediaQuery.size.height * 0.25,
            decoration: BoxDecoration(color: Colors.white),
          ),
          InkWell(
            onTap: () {
              widget.onDrawerItemClicked;
            },
            child: DrawerItems(
                imagePath: AppAssets.homeIcon,
                text: AppLocalizations.of(context)!.go_to_home),
          ),
          Divider(
            thickness: 2,
            color: ColorPalette.primaryColor,
            indent: mediaQuery.size.width * 0.06,
            endIndent: mediaQuery.size.width * 0.06,
          ),
          DrawerItems(
              imagePath: AppAssets.themeIcon,
              text: AppLocalizations.of(context)!.theme),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: mediaQuery.size.width * 0.04,
                vertical: mediaQuery.size.height * 0.01,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: mediaQuery.size.width * 0.04,
                vertical: mediaQuery.size.height * 0.01,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: ColorPalette.primaryColor, width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      themeProvider.appTheme == ThemeMode.dark
                          ? AppLocalizations.of(context)!.dark
                          : AppLocalizations.of(context)!.light,
                      style: AppStyles.medium20White),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: ColorPalette.primaryColor,
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 2,
            color: ColorPalette.primaryColor,
            indent: mediaQuery.size.width * 0.06,
            endIndent: mediaQuery.size.width * 0.06,
          ),
          DrawerItems(
              imagePath: AppAssets.languageIcon,
              text: AppLocalizations.of(context)!.language),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: mediaQuery.size.width * 0.04,
                vertical: mediaQuery.size.height * 0.01,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: mediaQuery.size.width * 0.04,
                vertical: mediaQuery.size.height * 0.01,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: ColorPalette.primaryColor, width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      languageProvider.appLanguage == 'en'
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: AppStyles.medium20White),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: ColorPalette.primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
  }
}
