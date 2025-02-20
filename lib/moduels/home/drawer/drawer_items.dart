import 'package:flutter/material.dart';
import 'package:news_app_two/core/constants/app_style.dart';
import 'package:news_app_two/core/extensions/extensions.dart';
import 'package:news_app_two/theme/color_palette.dart';
import 'package:news_app_two/core/extensions/padding_ext.dart';

class DrawerItems extends StatelessWidget {
  String text;
  String imagePath;

  DrawerItems({required this.text, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Row(
      children: [
        ImageIcon(
          AssetImage(imagePath),
          color: ColorPalette.primaryColor,
        ),
        SizedBox(
          width: mediaQuery.size.width * 0.02,
        ),
        Text(
          text,
          style: AppStyles.bold20Primary,
        )
      ],
    ).setHorizontalAndVerticalPadding(context, 0.03, 0.01);
  }
}
