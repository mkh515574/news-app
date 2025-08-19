import 'package:flutter/material.dart';
import 'package:news_app/features/news/view/widgets/news/news_item_view.dart';

import '../../../../../core/services/api/api_manger.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../model/SourceResponse.dart';
import '../../../model/news_response.dart';

class NewsListView extends StatefulWidget {
  NewsListView({super.key, required this.source});

  Sources source;

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
      future: ApiManager.getNewsBySourceId(widget.source.id!),
      builder: (context, snapshot) {
        //if loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.grayColor),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text(
                '${snapshot.error}',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.grayColor,
                ),
                onPressed: () {
                  ApiManager.getNewsBySourceId(widget.source.id ?? '');
                },
                child: Text(
                  'Try again',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        }

        if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(
                snapshot.data!.message!,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.grayColor,
                ),
                onPressed: () {
                  ApiManager.getNewsBySourceId(widget.source.id ?? '');
                },
                child: Text(
                  'Try again',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        }
        //todo:server =>success
        var newsList = snapshot.data?.articles ?? [];

        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return NewsItemView(news: newsList[index]);
            },
            itemCount: newsList.length,
          ),
        );
      },
    );
  }
}
