
import 'package:flutter/material.dart';


import 'package:news_app/features/home/view/widgets/drop_down_view.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_text_style.dart';

import '../../../../l10n/app_localizations.dart';


class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Drawer(
      child: Container(
        color: AppColors.blackColor,
        child: Column(
          children: [
            Container(
              height: height * 0.26,
              color: AppColors.whiteColor,
              alignment: Alignment.center,
              child: Text("News App", style: AppTextStyle.medium20Black),
            ),
            SizedBox(height: height * 0.02),
            ListTile(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.homeRouteName,
                );
              },
              leading: Icon(Icons.home, color: AppColors.whiteColor),
              title: Text(AppLocalizations.of(context)!.go_to_home, style: AppTextStyle.medium20White),
            ),
            SizedBox(height: height * 0.02),
            Divider(indent: width * 0.05, endIndent: width * 0.05),
            SizedBox(height: height * 0.02),
            DropDownView(),
          ],
        ),
      ),
    );
  }
}
