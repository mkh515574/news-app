import 'package:flutter/material.dart';
import 'package:news_app/features/home/model/category_model.dart';

import '../../../core/services/api/api_manger.dart';
import '../../../core/utils/app_colors.dart';
import '../model/SourceResponse.dart';
import 'widgets/sources/source_tab_view.dart';

class CategoryDetails extends StatefulWidget {
  final CategoryModel categoryModel ;
  const CategoryDetails({super.key, required this.categoryModel});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
      future: ApiManager.getSources(
        widget.categoryModel.id,
      ),
      builder: (context, snapshot) {
        //todo : we have 4 cases to handle
        //1-if loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.grayColor),
          );
        }
        //2- if error from our side like internet issue
        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'SomeThing went wrong.',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources(widget.categoryModel.id);
                    setState(() {});
                  },
                  child: Text(
                    'try again.',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          );
        }
        //3-if error from server
        if (snapshot.hasData && snapshot.data?.status != 'ok') {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'SomeThing went Wrong !',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text(
                  'try again',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        }
        //4-if response status :ok
        var sourceList = snapshot.data?.sources ?? [];
        return SourceTabView(sourcesList: sourceList);
      },
    );
  }
}
