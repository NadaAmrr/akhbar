import 'package:akhbar/core/utils/app_colors.dart';
import 'package:akhbar/features/news/provider/tab_provider.dart';
import 'package:akhbar/features/news/widgets/source_widget.dart';
import 'package:akhbar/models/SourcesResponse.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabWidget extends StatelessWidget {
  TabWidget({
    super.key,
    required this.sourcesList,
  });

  final List<Sources> sourcesList;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ChangeNotifierProvider(
            create: (BuildContext context) => TabProvider(),
            builder: (context, child) {
              var provider = Provider.of<TabProvider>(context);

              return DefaultTabController(
                  length: sourcesList.length,
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    isScrollable: true,
                    indicatorColor: AppColors.white.withOpacity(0),
                    onTap: (index) {
                      provider.changeIndex(index);
                    },
                    tabs: sourcesList
                        .map((e) => Tab(
                              child: SourceItem(
                                source: e,
                                isSelected: provider.selectedIndex ==
                                    sourcesList.indexOf(e),
                              ),
                            ))
                        .toList(),
                  ));
            }));
  }
}
