import 'package:flutter/material.dart';
import 'package:news_app/features/home/view/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: Theme.of(context).textTheme.titleMedium),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],

      ),
      body: HomeScreenBody(),
    );
  }
}
