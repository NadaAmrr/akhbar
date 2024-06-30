import 'package:akhbar/core/api/api_manager.dart';
import 'package:akhbar/core/enums/status_enum.dart';
import 'package:akhbar/features/news/widgets/tab_widget.dart';
import 'package:akhbar/models/SourcesResponse.dart';
import 'package:akhbar/models/category_model.dart';
import 'package:flutter/material.dart';

class NewsTab extends StatelessWidget {
  CategoryModel categoryModel;
  NewsTab({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return
      FutureBuilder<SourcesResponse?>(
        future: ApiManager.getSources(categoryModel.id),
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
                  ApiManager.getSources(categoryModel.id);
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
                      ApiManager.getSources(categoryModel.id);
                    },
                    child: Text(
                      "Try Again",
                      style: Theme.of(context).textTheme.titleMedium,
                    ))
              ],
            );
          }
          var sourcesList = snapshot.data!.sources ?? [];
          return TabWidget(sourcesList: sourcesList);
        },
      );

  }
}
