import 'package:flutter/material.dart';

import '../../../model/SourceResponse.dart';

class SourceName extends StatelessWidget {
  Sources source;
  bool isSelected;

  SourceName({super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(
      source.name ?? '',

      style: isSelected
          ? Theme.of(context).textTheme.labelMedium
          : Theme.of(context).textTheme.labelSmall,
    );
  }
}
