import 'package:flutter/material.dart';
import 'package:news_app_two/model/SourceResponse.dart';
import 'package:news_app_two/moduels/home/news/news_item.dart';
import 'package:news_app_two/moduels/home/news/news_widget_view_model.dart';
import 'package:news_app_two/theme/color_palette.dart';
import 'package:provider/provider.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsWidgetViewModel viewModel = NewsWidgetViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child:
          Consumer<NewsWidgetViewModel>(builder: (context, viewModel, child) {
        if (viewModel.errorMessage != null) {
          return Center(
              child: Column(
                children: [
                Text(
                  viewModel.errorMessage!,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(
                      onPressed: () {
                      viewModel.getNewsBySourceId(widget.source.id ?? "");
                      setState(() {});
                      },
                    child: Text('Try Again!'))
              ],
              ),
            );
        } else if (viewModel.newsList == null) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorPalette.greyColor,
            ),
            );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(
                news: viewModel.newsList![index],
              );
            },
            itemCount: viewModel.newsList!.length,
          );
        }
      }),
    );
  }
}
