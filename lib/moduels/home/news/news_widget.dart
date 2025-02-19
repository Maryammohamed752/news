import 'package:flutter/material.dart';
import 'package:news_app_two/api/api_manager.dart';
import 'package:news_app_two/model/NewsResponse.dart';
import 'package:news_app_two/model/SourceResponse.dart';
import 'package:news_app_two/moduels/home/news/news_item.dart';
import 'package:news_app_two/theme/color_palette.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsSourceId(widget.source.id ?? ""),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorPalette.greyColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  const Text('Something Went Wrong'),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getNewsSourceId(widget.source.id ?? "");
                        setState(() {});
                      },
                      child: Text('Try again!'))
                ],
              ),
            );
          }
          if (snapshot.data!.status != 'ok') {
            Center(
              child: Column(
                children: [
                  Text(snapshot.data!.status!),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getNewsSourceId(widget.source.id ?? "");
                        setState(() {});
                      },
                      child: Text('Try again!'))
                ],
              ),
            );
          }
          var newsList = snapshot.data!.articles!;
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(
                news: newsList[index],
              );
            },
            itemCount: newsList.length,
          );
        });
  }
}
