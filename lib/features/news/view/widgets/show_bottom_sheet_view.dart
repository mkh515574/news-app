import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/news_response.dart';
import 'web_view_item.dart';

class ShowBottomSheetView extends StatefulWidget {
  final News news;

  const ShowBottomSheetView({super.key, required this.news});

  @override
  State<ShowBottomSheetView> createState() => _ShowBottomSheetViewState();
}

class _ShowBottomSheetViewState extends State<ShowBottomSheetView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.02,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.02,
      ),

      decoration: BoxDecoration(
        color: Theme.of(context).indicatorColor,
        borderRadius: BorderRadius.circular(size.width * 0.04),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,

        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: widget.news.urlToImage ?? "",
              fit: BoxFit.fill,
              width: double.infinity,
              height: size.height * 0.25,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.broken_image),
            ),
          ),

          SizedBox(height: size.height * 0.02),
          Text(
            "${widget.news.description}  + [${widget.news.description?.length}]" ,
            style: Theme.of(context).textTheme.headlineSmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          SizedBox(height: size.height * 0.02),

          SizedBox(
            width: double.infinity,
            height: size.height * 0.06,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        WebPageView(url: widget.news.url ?? ""),
                  ),
                );
              },
              child: Text(
                'View Full Articel',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
