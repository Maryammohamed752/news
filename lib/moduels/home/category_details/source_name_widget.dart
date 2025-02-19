import 'package:flutter/material.dart';
import 'package:news_app_two/core/constants/app_style.dart';
import 'package:news_app_two/model/SourceResponse.dart';

class SourceNameWidget extends StatelessWidget {
  Source source;
  bool isSelected;

  SourceNameWidget({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(
      source.name ?? '',
      style: isSelected
          ? Theme.of(context).textTheme.headlineLarge
          : Theme.of(context).textTheme.headlineMedium,
    );
  }
}
