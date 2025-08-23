import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/news/model/news_response.dart';

class NewsItemView extends StatelessWidget {
  const NewsItemView({super.key, required this.news});

  final News news;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height * 0.37,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).indicatorColor, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? "",
              fit: BoxFit.fill,
              width: double.infinity,
              height: height * 0.22,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.broken_image),
            ),
          ),

          SizedBox(height: height * 0.02),
          Text(
            news.title ?? "",

            style: Theme.of(context).textTheme.labelMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                news.author != null
                    ? "By ${news.author!.length > 20 ? "${news.author!.substring(0, 20)}..." : news.author!}"
                    : "By Unknown",
                style: Theme.of(context).textTheme.labelLarge,
              ),

              Text(
                news.publishedAt != null
                    ? formatTimeAgo(news.publishedAt!)
                    : "Unknown Date",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String formatTimeAgo(String publishedAt) {
    final date = DateTime.parse(publishedAt);
    final diff = DateTime.now().difference(date);

    if (diff.inDays > 0) {
      return "${diff.inDays} day${diff.inDays > 1 ? 's' : ''} ago";
    } else if (diff.inHours > 0) {
      return "${diff.inHours} h ago";
    } else {
      return "${diff.inMinutes} min ago";
    }
  }
}
