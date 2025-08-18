import 'package:flutter/material.dart';
import 'package:news_app/features/home/view/widgets/home_screen_body.dart';
import 'package:news_app/l10n/app_localizations.dart';

import 'widgets/drawer_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.home, style: Theme.of(context).textTheme.titleMedium),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      drawer: DrawerView(),
      body: HomeScreenBody(),
    );
  }
}
