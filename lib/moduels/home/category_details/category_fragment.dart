import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryFragment extends StatelessWidget {
  const CategoryFragment({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.02),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!
                .good_morning_here_is_some_news_for_you,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return Container();
            },
            itemCount: 7,
          ))
        ],
      ),
    );
  }
}
