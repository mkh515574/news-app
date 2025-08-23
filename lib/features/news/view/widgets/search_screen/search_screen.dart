import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:news_app/features/news/view/widgets/search_screen/search_text_field.dart';


import '../../../../../core/services/api/api_manger.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../model/news_response.dart';
import '../news/news_item_view.dart';
import '../web_view_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? textSearch;
  List<News> searchNewsList = [];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
            left: width * 0.04,
            right: width * 0.04,
            top: height * 0.02,
          ),
          child: Column(
            children: [
              SearchTextField(
                searchTextFunction: (text) {
                  textSearch = text;
                  setState(() {});
                },
              ),
              SizedBox(height: height * 0.02),
              FutureBuilder(
                future: (textSearch != null && textSearch!.isNotEmpty)
                    ? ApiManager.getNewsBySearch(textSearch ?? '')
                    : Future.value(null),
                builder: (context, snapshot) {
                  searchNewsList = snapshot.data?.articles ?? [];
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.grayColor,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      children: [
                        Text(
                          'Something went wrong',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.grayColor,
                          ),
                          onPressed: () {
                            ApiManager.getNewsBySearch(textSearch ?? '');
                            setState(() {});
                          },
                          child: Text(
                            'Try Again',
                            style: TextTheme.of(context).labelMedium,
                          ),
                        ),
                      ],
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor: AppColors.transparentColor,
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: width * 0.04,
                                    right: width * 0.04,
                                    bottom: height * 0.02,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      right: width * 0.02,
                                      left: width * 0.02,
                                      top: height * 0.01,
                                    ),
                                    height: height * 0.5,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                searchNewsList[index]
                                                    .urlToImage ??
                                                '',
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            fit: BoxFit.cover,
                                            height: height * 0.25,
                                          ),
                                        ),
                                        SizedBox(height: height * 0.01),
                                        Text(
                                          searchNewsList[index].content ?? '',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium,
                                          maxLines: 5,
                                          overflow: TextOverflow.clip,
                                        ),
                                        SizedBox(height: height * 0.01),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => WebPageView(
                                                  url:
                                                      searchNewsList[index]
                                                          .url ??
                                                      '',
                                                ),
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Theme.of(
                                              context,
                                            ).primaryColor,
                                            padding: EdgeInsets.symmetric(
                                              vertical: height * 0.02,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: Text(
                                            'View Full Articel',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.labelLarge,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: NewsItemView(news: searchNewsList[index]),
                        );
                      },
                      itemCount: searchNewsList.length,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
