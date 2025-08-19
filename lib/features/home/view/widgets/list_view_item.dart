import 'package:flutter/material.dart';
import 'package:news_app/core/services/provider/language_provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../model/category_model.dart';

class ListViewItem extends StatelessWidget {
  final CategoryModel category;
  final int index;

  const ListViewItem({required this.category, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool isEven = (index % 2 == 0);
    return Stack(
      textDirection: isEven ? TextDirection.ltr : TextDirection.rtl,
      alignment: isEven ? Alignment.bottomRight : Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset(
            category.imagePath,
            fit: BoxFit.fill,
            height: size.height * 0.25,
            width: size.width,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              SizedBox(height: size.height * 0.09),
              Container(
                alignment: Alignment.bottomRight,

                margin: EdgeInsets.all(size.width * 0.02),

                width: size.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: AppColors.grayColor.withOpacity(0.5),
                ),
                child: Row(
                  textDirection: LanguageProvider().getLanguage() == 'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.view_all,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(width: size.width * 0.02),
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: size.width * 0.05,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context).indicatorColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
