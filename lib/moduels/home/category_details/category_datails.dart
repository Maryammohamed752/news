import 'package:flutter/material.dart';
import 'package:news_app_two/api/api_manager.dart';
import 'package:news_app_two/model/SourceResponse.dart';
import 'package:news_app_two/moduels/home/category_details/source_tab_widget.dart';
import 'package:news_app_two/theme/color_palette.dart';

class CategoryDatails extends StatefulWidget {
  static const String routeName = 'category_details';

  const CategoryDatails({super.key});

  @override
  State<CategoryDatails> createState() => _CategoryDatailsState();
}

class _CategoryDatailsState extends State<CategoryDatails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: ColorPalette.greyColor),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              const Text('Something Went Wrong'),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources();
                    setState(() {});
                  },
                  child: Text('Try again'))
            ],
          );
        }
        if (snapshot.data!.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources();
                    setState(() {});
                  },
                  child: Text('Try again'))
            ],
          );
        }
        var sourceList = snapshot.data!.sources ?? [];
        return SourceTabWidget(sourceList: sourceList);
      },
    );
  }
}
