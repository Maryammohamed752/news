import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app_two/api/api_manager.dart';
import 'package:news_app_two/model/NewsResponse.dart';
import 'package:news_app_two/moduels/home/news/news_item.dart';
import 'package:news_app_two/theme/color_palette.dart';

class SearchView extends StatefulWidget {
  static const String routeName = 'search_view';

  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<News> news = [];
  int maxResult = 0;
  int currentPage = 1;
  String? errorMessage = "";
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (controller.text.isNotEmpty && maxResult > news.length) {
          _search();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            leadingWidth: 0,
            leading: SizedBox(),
            toolbarHeight: 95,
            title: TextFormField(
              onFieldSubmitted: (value) {
                currentPage = 1;
                maxResult = 0;
              },
              controller: controller,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  hintText: AppLocalizations.of(context)!.search,
                  suffixStyle: Theme.of(context).textTheme.labelMedium,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 25,
                  ),
                  suffixIcon: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        size: 25,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.black26)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.black26)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.black26)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.black26))),
            ),
          ),
          if (errorMessage != null)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          if (news.isEmpty && errorMessage == null)
            SliverToBoxAdapter(
              child: Lottie.asset("assets/animation/empty.json"),
            ),
          if (news.isNotEmpty)
            SliverList.separated(
              itemBuilder: (context, index) {
                if (maxResult == news.length) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorPalette.primaryColor,
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: NewsItem(
                      news: news[index],
                    ),
                  );
                }
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 16,
              ),
              itemCount:
                  news.length < maxResult ? news.length + 1 : news.length,
            ),
        ],
      ),
    );
  }

  _search() async {
    errorMessage = "";
    try {
      var response = await ApiManager.searchNews(
          searchQuery: controller.text, pageNumber: currentPage);
      news.addAll(response.articles ?? []);

      currentPage++;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      setState(() {});
    }
  }
}
