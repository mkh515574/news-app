import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/features/news/view/widgets/news/news_item_view.dart';
import 'package:news_app/features/news/view/widgets/show_bottom_sheet_view.dart';

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
  late final PagingController<int, News> _pagingController;
  @override
  void initState() {
    super.initState();

    _pagingController = PagingController<int, News>(
      getNextPageKey: (state) {
        return state.lastPageIsEmpty ? null : state.nextIntPageKey;
      },
      fetchPage: (pageKey) async {
        await Future.delayed(const Duration(seconds: 2));
        try {
          final newsResponse = await ApiManager.getNewsBySourceId(
            widget.source.id ?? '',
            pageKey.toString(),
          );
          return newsResponse?.articles ?? [];
        } on Exception catch (e) {
          rethrow;
        }
      },
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
      future: ApiManager.getNewsBySourceId(widget.source.id!,"1"),
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
                  ApiManager.getNewsBySourceId(widget.source.id ?? '',"1");
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
                  ApiManager.getNewsBySourceId(widget.source.id ?? '',"1");
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
          child: RefreshIndicator(
            onRefresh: () async => _pagingController.refresh(),
            child: PagingListener(
              controller: _pagingController,
              builder: (context, state, fetchNextPage) {
                return PagedListView<int, News>(
                  state: state,
                  fetchNextPage: fetchNextPage,
                  builderDelegate: PagedChildBuilderDelegate(
                    itemBuilder: (context, item, index) {
                      return InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return ShowBottomSheetView(news: newsList[index]);
                              setState(() {});
                            },
                          );
                        },
                        child: NewsItemView(news: newsList[index]),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
