import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/features/news/view/widgets/news/news_item_view.dart';

import '../../../../../core/services/api/api_manger.dart';

import '../../../model/SourceResponse.dart';
import '../../../model/news_response.dart';
import '../show_bottom_sheet_view.dart';

class NewsListView extends StatefulWidget {
  Sources source;

  NewsListView({super.key, required this.source});

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
          throw e;
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

    return Expanded(
      child: RefreshIndicator(
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
                      ShowBottomSheetView(news: item);
                      setState(() {

                      });
                    },
                    child: NewsItemView(news: item),
                  );
                },
              ),
            );
          },
        ),
        onRefresh: () async => _pagingController.refresh(),
      ),
    );
  }
}
