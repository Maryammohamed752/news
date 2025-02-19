import 'package:flutter/material.dart';
import 'package:news_app_two/core/extensions/padding_ext.dart';
import 'package:news_app_two/moduels/home/category_details/category_datails.dart';
import 'package:news_app_two/theme/app_theme.dart';
import 'package:news_app_two/theme/color_palette.dart';
import 'package:news_app_two/widgets/drawer_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatelessWidget {
  static const String routeName = 'home_view';

  @override
  Widget build(BuildContext context) {
    //int selectedCatogery;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.home,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        centerTitle: true,
      ),
      body: CategoryDatails(),
    );

    void onDrawerItemClicked(selectedCatogry) {
      selectedCatogry = null;
      //Navigator.pop(context);
    }
  }
}
