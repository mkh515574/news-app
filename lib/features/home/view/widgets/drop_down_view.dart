import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/services/language_provider.dart';
import '../../../../core/services/theme_provider.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../l10n/app_localizations.dart';
import 'drawer_selected_item.dart';

class DropDownView extends StatefulWidget {
  const DropDownView({super.key});

  @override
  State<DropDownView> createState() => _DropDownViewState();
}

class _DropDownViewState extends State<DropDownView> {
  String selectedTheme = "Dark";
  String selectedLang = "English";

  final List<String> themes = ["Dark", "Light"];
  final List<String> languages = ["English", "Arabic"];

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    return Column(
      children: [
        // THEME DROPDOWN
        DrawerSelectedItem(title: lang.theme, imagePath: AppAssets.languageIcon),

        _buildDropdown(
          title: "Theme",
          value: selectedTheme,
          items: themes,
          onChanged: (newValue) {
            if (newValue == null) return;
            setState(() => selectedTheme = newValue);

            final themeProvider = Provider.of<ThemeProvider>(
              context,
              listen: false,
            );

            themeProvider.setThemeMode(newValue == "Dark");
          },
        ),

        DrawerSelectedItem(
          title: lang.language,
          imagePath: AppAssets.languageIcon,
        ),

        _buildDropdown(
          title: "Language",
          value: selectedLang,
          items: languages,
          onChanged: (newValue) {
            if (newValue == null) return;
            setState(() => selectedLang = newValue);

            final localeProvider = Provider.of<LanguageProvider>(
              context,
              listen: false,
            );

            localeProvider.changeLanguage(newValue == "Arabic" ? 'ar' : 'en');
          },
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String title,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.whiteColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          dropdownColor: AppColors.blackColor,
          icon: Icon(Icons.arrow_drop_down, color: AppColors.whiteColor),
          style: AppTextStyle.medium20White,
          onChanged: onChanged,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item, style: AppTextStyle.medium20White),
            );
          }).toList(),
        ),
      ),
    );
  }
}
