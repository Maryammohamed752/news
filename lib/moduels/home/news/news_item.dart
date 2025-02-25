import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_two/core/constants/app_style.dart';
import 'package:news_app_two/model/NewsResponse.dart';
import 'package:news_app_two/theme/color_palette.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        _showNewsDetailsBottomSheet(context, news);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: height * 0.02, horizontal: width * 0.04),
        padding: EdgeInsets.symmetric(
            vertical: height * 0.01, horizontal: width * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).indicatorColor, width: 2),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? '',
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: ColorPalette.greyColor,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              news.title ?? "",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  'By:${news.author ?? ""}',
                  style: AppStyles.medium12Grey,
                )),
                Text(
                  news.publishedAt ?? "",
                  style: AppStyles.medium12Grey,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

void _showNewsDetailsBottomSheet(BuildContext context, News news) {
  showModalBottomSheet(
      context: context,
      isDismissible: true,
      backgroundColor: ColorPalette.transparentColor,
      isScrollControlled: true,
      builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: news.urlToImage ?? '',
                      placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(
                        color: ColorPalette.greyColor,
                      )),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    news.description ?? "",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  FilledButton(
                      onPressed: () {
                        launchUrl(Uri.parse(news.url ?? ""),
                            mode: LaunchMode.inAppBrowserView);
                      },
                      style: Theme.of(context).filledButtonTheme.style,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "View Fill New",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ))
                ]),
              )
            ],
          ));
}
