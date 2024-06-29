import 'package:akhbar/core/api/api_manager.dart';
import 'package:akhbar/core/enums/status_enum.dart';
import 'package:akhbar/features/news/widgets/news_item_widget.dart';
import 'package:akhbar/models/SourcesResponse.dart';
import 'package:flutter/material.dart';

class NewsTab extends StatelessWidget {
  const NewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse?>(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return ElevatedButton(
                onPressed: () {
                  ApiManager.getSources();
                },
                child: Text(
                  "Try Again",
                  style: Theme.of(context).textTheme.titleMedium,
                ));
          }
          if (snapshot.data!.status == Status.error.toString()) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(snapshot.data?.message ?? ""),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources();
                    },
                    child: Text(
                      "Try Again",
                      style: Theme.of(context).textTheme.titleMedium,
                    ))
              ],
            );
          }
          var sourcesList = snapshot.data!.sources ?? [];
          return ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      // widget.onArticleItemClicked(CategoryDetailsCubit.get(context)
                      //     .articleList[index]);
                    },
                    child: NewsItemWidget(news: sourcesList[index])),
              );
            },
            itemCount: sourcesList.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 12,
              );
            },
          );
        },

    );

    // DefaultTabController(
    //   length: CategoryDetailsCubit.get(context).sourcesList.length,
    //   child: TabBar(
    //     dividerColor: Colors.transparent,
    //     isScrollable: true,
    //     indicatorColor: Colors.transparent,
    //     onTap: (value) {
    //       // CategoryDetailsCubit.get(context).onSourceChange(value);
    //     },
    //     tabs: CategoryDetailsCubit.get(context)
    //         .sourcesList
    //         .map((e) => Tab(
    //       child: SourceItem(
    //         source: e,
    //         isSelected: CategoryDetailsCubit.get(context)
    //             .sourcesList
    //             .elementAt(
    //             CategoryDetailsCubit.get(context)
    //                 .selectedIndex) ==
    //             e,
    //       ),
    //     )).toList(),
    //   ));
  }
}
