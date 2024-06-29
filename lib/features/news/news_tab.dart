import 'package:akhbar/core/api/api_manager.dart';
import 'package:akhbar/core/enums/status_enum.dart';
import 'package:akhbar/features/news/widgets/articles_widget.dart';
import 'package:akhbar/features/news/widgets/news_item_widget.dart';
import 'package:akhbar/features/news/widgets/tab_widget.dart';
import 'package:akhbar/models/SourcesResponse.dart';
import 'package:flutter/material.dart';

class NewsTab extends StatelessWidget {
  const NewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Column(
      children: [
        FutureBuilder<SourcesResponse?>(
          future: ApiManager.getSources(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Expanded(
                flex: 1,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
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
            var selectedIndex = 0;
            return TabWidget(sourcesList: sourcesList);
          },
        ),
        ////////
      ArticlesWidget()
      ],
    );

  }
}
