import 'package:flutter/material.dart';
import 'package:news_app_two/model/category_model.dart';
import 'package:news_app_two/moduels/home/category_details/category_details_view_model.dart';
import 'package:news_app_two/moduels/home/category_details/source_tab_widget.dart';
import 'package:news_app_two/theme/color_palette.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'category_details';
  CategoryModel category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<CategoryDetailsViewModel>(
            builder: (context, viewModel, child) {
          if (viewModel.errorMessage != null) {
            return Column(
              children: [
                Text(
                  viewModel.errorMessage!,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getSources(widget.category.id);
                    },
                    child: Text('Try Again'))
              ],
            );
          }
          if (viewModel.sourcesList == null) {
            return Center(
              child: CircularProgressIndicator(color: ColorPalette.greyColor),
            );
          } else {
            return SourceTabWidget(sourceList: viewModel.sourcesList!);
          }
        }));
  }
}
