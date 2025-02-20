import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app_two/model/category_model.dart';
import 'package:news_app_two/theme/color_palette.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList = CategoryModel.getCategoriesList();
  Function onViewAllClicked;

  CategoryFragment({required this.onViewAllClicked});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!
                .good_morning_here_is_some_news_for_you,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: height * 0.02,
                  );
                },
            itemBuilder: (context, index) {
              return Stack(
                alignment: index % 2 == 0
                    ? Alignment.bottomRight
                    : Alignment.bottomLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(categoriesList[index].imagePath),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: height * 0.02,
                        right: width * 0.01,
                        left: width * 0.01),
                    child: ToggleSwitch(
                      customWidths: [100, 60],
                      // minWidth: 90.0,
                      cornerRadius: 20.0,
                      activeBgColors: [
                        [ColorPalette.blackColor],
                        [ColorPalette.greyColor]
                      ],
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      initialLabelIndex: 1,
                      totalSwitches: 2,
                      customWidgets: [
                        Text(
                          AppLocalizations.of(context)!.view_all,
                          style: Theme.of(context).toggleButtonsTheme.textStyle
                            /*.textTheme
                              .headlineLarge,*/
                            ),
                        CircleAvatar(
                          backgroundColor: Theme
                              .of(context)
                              .primaryColor,
                          radius: 60, child: Icon(
                              color: Theme.of(context).iconTheme.color,
                              Icons.arrow_forward_ios_outlined),)
                      ],
                      radiusStyle: true,
                      onToggle: (index1) {
                        print('switched to: $index');
                        onViewAllClicked(categoriesList[index]);
                      },
                    ),
                  ),
                ],
              );
            },
                itemCount: categoriesList.length,
          ))
        ],
      ),
    );
  }
}
