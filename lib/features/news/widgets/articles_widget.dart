import 'package:akhbar/core/api/api_manager.dart';
import 'package:akhbar/core/enums/status_enum.dart';
import 'package:akhbar/features/news/widgets/news_item_widget.dart';
import 'package:akhbar/models/ArticlesResponse.dart';
import 'package:akhbar/models/source.dart';
import 'package:flutter/material.dart';

class ArticlesWidget extends StatelessWidget {
  Source source;

  ArticlesWidget({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticlesResponse?>(
        future: ApiManager.getArticles(source.id ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Expanded(
              child: Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return ElevatedButton(
                onPressed: () {
                  ApiManager.getArticles(source.id ?? '');
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
                      ApiManager.getArticles(source.id ?? '');
                    },
                    child: Text(
                      "Try Again",
                      style: Theme.of(context).textTheme.titleMedium,
                    ))
              ],
            );
          }
          var articleList = snapshot.data!.articles ?? [];
          return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {},
                        child: ArticleItemWidget(news: articleList[index])));
              },
              itemCount: articleList.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 12,
                );
              },
            ),
          );
        });
  }
}
