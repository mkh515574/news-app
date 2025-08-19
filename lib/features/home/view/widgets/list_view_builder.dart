import 'package:flutter/material.dart';
import 'package:news_app/features/home/view/widgets/list_view_item.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/provider/theme_provider.dart';
import '../../model/category_model.dart';

typedef OnCategoryTap = void Function(CategoryModel category);

class ListViewBuilder extends StatelessWidget {
  final OnCategoryTap? onCategoryTap;

  ListViewBuilder({super.key, required this.onCategoryTap});

  List<CategoryModel> categories = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    categories = CategoryModel.getCategories(
      Provider.of<ThemeProvider>(context, listen: false).themeMode ==
          ThemeMode.dark,
      context,
    );
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          onCategoryTap!.call(categories[index]);
        },
        child: ListViewItem(category: categories[index], index: index),
      ),
      separatorBuilder: (context, index) =>
          SizedBox(height: size.height * 0.02),
      itemCount: categories.length,
    );
  }
}
