import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_routes.dart';
import 'package:news_app/features/home/model/category_model.dart';
import 'package:news_app/features/home/view/widgets/home_screen_body.dart';
import 'package:news_app/features/news/view/category_details.dart';
import 'package:news_app/l10n/app_localizations.dart';

import 'widgets/drawer_view.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null
              ? AppLocalizations.of(context)!.home
              : selectedCategory!.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [IconButton(onPressed: () {
          Navigator.pushNamed(context, AppRoutes.searchRouteName);
        }, icon: const Icon(Icons.search))],
      ),
      drawer: DrawerView(),
      body: selectedCategory == null
          ? HomeScreenBody(onCategoryTap: onCategoryItemClick)
          : CategoryDetails(categoryModel: selectedCategory!),
    );
  }

  CategoryModel? selectedCategory;

  void onCategoryItemClick(CategoryModel newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }
}
