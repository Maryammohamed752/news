import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app_two/model/NewsResponse.dart';

class SearchView extends StatefulWidget {
  static const String routeName = 'search_view';

  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<News> news = [];
  int maxPage = 0;
  int currentPage = 1;
  String? errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leadingWidth: 0,
            leading: SizedBox(),
            toolbarHeight: 95,
            title: TextFormField(
              decoration: InputDecoration(
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
          if (news.isEmpty)
            SliverToBoxAdapter(
              child: Lottie.asset("assets/animation/empty.json"),
            ),
        ],
      ),
    );
  }
}
