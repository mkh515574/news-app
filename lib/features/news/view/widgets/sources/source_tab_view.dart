import 'package:flutter/material.dart';


import '../../../../../core/utils/app_colors.dart';
import '../../../model/SourceResponse.dart';
import '../news/news_list_view.dart';
import 'source_name.dart';

class SourceTabView extends StatefulWidget {
  List<Sources> sourcesList;

  SourceTabView({super.key, required this.sourcesList});

  @override
  State<SourceTabView> createState() => _SourceTabViewState();
}

class _SourceTabViewState extends State<SourceTabView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            tabAlignment: TabAlignment.start,
            dividerColor: AppColors.transparentColor,
            indicatorColor: Theme.of(context).cardColor,
            padding: EdgeInsets.zero,
            isScrollable: true,
            tabs: widget.sourcesList.map((source) {
              return SourceName(
                source: source,
                isSelected: selectedIndex == widget.sourcesList.indexOf(source),
              );
            }).toList(),
          ),
          NewsListView(source: widget.sourcesList[selectedIndex]),
        ],
      ),
    );
  }
}
