import 'package:flutter/material.dart';
import 'package:news_app/features/home/view/widgets/list_view_item.dart';

import '../../model/category_model.dart';

class ListViewBuilder extends StatelessWidget {
  ListViewBuilder({super.key});

   List<CategoryModel> categories = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    categories = CategoryModel.getCategories(true);
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => ListViewItem(
        category: categories[index],
        index: index,
      ),
      separatorBuilder: (context, index) =>
          SizedBox(height: size.height * 0.02),
      itemCount: categories.length,
    );
  }
}
