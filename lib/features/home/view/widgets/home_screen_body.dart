import 'package:flutter/material.dart';
import 'package:news_app/features/home/view/widgets/list_view_builder.dart';


class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning\nHere is Some News For You",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: size.height * 0.02),
            ListViewBuilder(),
          ],
        ),
      ),
    );
  }
}
