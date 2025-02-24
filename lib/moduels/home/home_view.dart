import 'package:flutter/material.dart';
//import 'package:news_app_two/moduels/home/drawer/drawer_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app_two/model/category_model.dart';
import 'package:news_app_two/moduels/home/category_details/category_details.dart';
import 'package:news_app_two/moduels/home/category_details/category_fragment.dart';
import 'package:news_app_two/moduels/search/search_view.dart';

import 'drawer/home_drawer.dart';

class HomeView extends StatefulWidget {
  static const String routeName = 'home_view';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    //int selectedCatogery;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchView.routeName);
            },
            icon: const Icon(
              Icons.search_rounded,
              size: 30,
            ),
          )
        ],
        title: Text(
          selectedCategory == null
              ? AppLocalizations.of(context)!.home
              : selectedCategory!.title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
        child: HomeDrawer(onDrawerItemClicked: onDrawerItemClicked),
      ),
      body: selectedCategory == null
          ? CategoryFragment(
              onViewAllClicked: onViewAllClicked,
            )
          : CategoryDetails(
              category: selectedCategory!,
            ),
    );
  }

  CategoryModel? selectedCategory;

  void onDrawerItemClicked() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }

  void onViewAllClicked(CategoryModel newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }
}
