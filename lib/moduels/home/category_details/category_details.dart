import 'package:flutter/material.dart';
import 'package:news_app_two/api/api_manager.dart';
import 'package:news_app_two/model/SourceResponse.dart';
import 'package:news_app_two/model/category_model.dart';
import 'package:news_app_two/moduels/home/category_details/source_tab_widget.dart';
import 'package:news_app_two/theme/color_palette.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'category_details';
  CategoryModel category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
      future: ApiManager.getSources(widget.category.id),
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
                    ApiManager.getSources(widget.category.id);
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
                    ApiManager.getSources(widget.category.id);
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
