
import 'package:akhbar/core/utils/app_colors.dart';
import 'package:akhbar/features/news/widgets/source_widget.dart';
import 'package:akhbar/models/SourcesResponse.dart';
import 'package:flutter/material.dart';
class TabWidget extends StatelessWidget {
  const TabWidget({
    super.key,
    required this.sourcesList,
  });

  final List<Sources> sourcesList;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child:
        DefaultTabController(
            length: sourcesList.length,
            child: TabBar(
              dividerColor: Colors.transparent,
              isScrollable: true,
              indicatorColor: AppColors.white.withOpacity(0),
              onTap: (value) {
                // CategoryDetailsCubit.get(context).onSourceChange(value);
              },
              tabs: sourcesList.map((e) => Tab(
                child: SourceItem(
                  source: e,
                  isSelected: true,
                ),
              )).toList(),
            ))
    );
  }
}
