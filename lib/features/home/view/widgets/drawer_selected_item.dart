import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';


class DrawerSelectedItem extends StatelessWidget {
  final String title;
  final String imagePath;
  const DrawerSelectedItem({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [

          Image.asset(imagePath),
          SizedBox(width: width * 0.02),
          Text(title, style: AppTextStyle.medium20White),
        ],
      ),
    );
  }
}
