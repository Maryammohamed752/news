import 'package:news_app_two/core/constants/app_assets.dart';

class CategoryModel {
  String id;
  String title;
  String imagePath;

  CategoryModel(
      {required this.id, required this.title, required this.imagePath});

  static List<CategoryModel> getCategoriesList() {
    return [
      CategoryModel(
          id: 'sports', title: 'Sports', imagePath: AppAssets.sportsLightImage),
      CategoryModel(
          id: 'business',
          title: 'Business',
          imagePath: AppAssets.businessLightImage),
      CategoryModel(
          id: 'entertainment',
          title: 'Entertainment',
          imagePath: AppAssets.entertainmentLightImage),

      CategoryModel(
          id: 'health', title: 'Health', imagePath: AppAssets.healthLightImage),
      CategoryModel(
          id: 'general',
          title: 'General',
          imagePath: AppAssets.generalLightImage),
      CategoryModel(
          id: 'technology',
          title: 'Technology',
          imagePath: AppAssets.technologyLightImage),
      CategoryModel(
          id: 'science',
          title: 'Science',
          imagePath: AppAssets.scienceLightImage),
    ];
  }
}

