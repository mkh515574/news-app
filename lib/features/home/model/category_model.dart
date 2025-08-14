import '../../../core/utils/app_assets.dart';

class CategoryModel {
  String id;
  String title;
  String imagePath;

  CategoryModel({
    required this.id,
    required this.title,
    required this.imagePath,
  });

  static List<CategoryModel> getCategories(bool isDark) {
    return [
      CategoryModel(
        id: "general",
        title: "General",
        imagePath: isDark
            ? AppAssets.generalDarkImage
            : AppAssets.generalLightImage,
      ),
      CategoryModel(
        id: "business",
        title: "Business",
        imagePath: isDark
            ? AppAssets.businessDarkImage
            : AppAssets.businessLightImage,
      ),
      CategoryModel(
        id: "sports",
        title: "Sports",
        imagePath: isDark
            ? AppAssets.sportsDarkImage
            : AppAssets.sportsLightImage,
      ),
      CategoryModel(
        id: "technology",
        title: "Technology",
        imagePath: isDark
            ? AppAssets.technologyDarkImage
            : AppAssets.technologyLightImage,
      ),

      CategoryModel(
        id: "science",
        title: "Science",
        imagePath: isDark
            ? AppAssets.scienceDarkImage
            : AppAssets.scienceLightImage,
      ),

      CategoryModel(
        id: "health",
        title: "Health",
        imagePath: isDark
            ? AppAssets.healthDarkImage
            : AppAssets.healthLightImage,
      ),
      CategoryModel(
        id: "entertainment",
        title: "Entertainment",
        imagePath: isDark
            ? AppAssets.entertainmentDarkImage
            : AppAssets.entertainmentLightImage,
      ),


    ];
  }
}
