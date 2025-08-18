import '../../../core/utils/app_assets.dart';
import '../../../l10n/app_localizations.dart';

class CategoryModel {
  String id;
  String title;
  String imagePath;

  CategoryModel({
    required this.id,
    required this.title,
    required this.imagePath,
  });



  static List<CategoryModel> getCategories(bool isDark,context) {
    var lang = AppLocalizations.of(context)!;
    return [
      CategoryModel(
        id: "general",
        title: lang.general,
        imagePath: isDark
            ? AppAssets.generalDarkImage
            : AppAssets.generalLightImage,
      ),
      CategoryModel(
        id: "business",
        title: lang.business,
        imagePath: isDark
            ? AppAssets.businessDarkImage
            : AppAssets.businessLightImage,
      ),
      CategoryModel(
        id: "sports",
        title: lang.sports,
        imagePath: isDark
            ? AppAssets.sportsDarkImage
            : AppAssets.sportsLightImage,
      ),
      CategoryModel(
        id: "technology",
        title: lang.technology,
        imagePath: isDark
            ? AppAssets.technologyDarkImage
            : AppAssets.technologyLightImage,
      ),

      CategoryModel(
        id: "science",
        title: lang.science,
        imagePath: isDark
            ? AppAssets.scienceDarkImage
            : AppAssets.scienceLightImage,
      ),

      CategoryModel(
        id: "health",
        title: lang.health,
        imagePath: isDark
            ? AppAssets.healthDarkImage
            : AppAssets.healthLightImage,
      ),
      CategoryModel(
        id: "entertainment",
        title: lang.entertainment,
        imagePath: isDark
            ? AppAssets.entertainmentDarkImage
            : AppAssets.entertainmentLightImage,
      ),


    ];
  }
}
