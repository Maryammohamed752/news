import 'package:news_app_two/core/constants/app_assets.dart';

class CategoryModel {
  String id;
  String title;
  String imagePath;
  CategoryModel(
      {required this.id, required this.title, required this.imagePath});

  static List<CategoryModel> getCategoriesList(bool isDark) {
    return [
      CategoryModel(
          id: 'sports',
          title: 'Sports',
          imagePath:
              isDark ? AppAssets.sportsLightImage : AppAssets.sportsDarkImage),
      CategoryModel(
          id: 'business',
          title: 'Business',
          imagePath: isDark
              ? AppAssets.businessLightImage
              : AppAssets.businessDarkImage),
      CategoryModel(
          id: 'entertainment',
          title: 'Entertainment',
          imagePath: isDark
              ? AppAssets.entertainmentLightImage
              : AppAssets.entertainmentDarkImage),
      CategoryModel(
          id: 'health',
          title: 'Health',
          imagePath:
              isDark ? AppAssets.healthLightImage : AppAssets.healthDarkImage),
      CategoryModel(
          id: 'general',
          title: 'General',
          imagePath: isDark
              ? AppAssets.generalLightImage
              : AppAssets.generalDarkImage),
      CategoryModel(
          id: 'technology',
          title: 'Technology',
          imagePath: isDark
              ? AppAssets.technologyLightImage
              : AppAssets.technologyDarkImage),
      CategoryModel(
          id: 'science',
          title: 'Science',
          imagePath: isDark
              ? AppAssets.scienceLightImage
              : AppAssets.scienceDarkImage),
    ];
  }
}
