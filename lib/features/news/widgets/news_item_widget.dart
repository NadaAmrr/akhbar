import 'package:akhbar/models/ArticlesResponse.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArticleItemWidget extends StatelessWidget {
  Articles news;
  ArticleItemWidget({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    String formatPublishedAt(String dateStr) {
      DateTime dateTime = DateTime.parse(dateStr);
      return DateFormat('MMMM dd, yyyy h:mm a').format(dateTime);
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.07),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 3, color: Theme.of(context).primaryColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // CachedNetworkImage(
          //   imageUrl: articles.urlToImage ?? "",
          //   placeholder: (context, url) => CircularProgressIndicator(),
          //   errorWidget: (context, url, error) => Icon(Icons.error),
          // ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              news.urlToImage ?? "",
              height: 250,
              fit: BoxFit.fill,
            ),
          ),

          Text(news.title ?? "",
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            height: 5,
          ),
          Text(news.description ?? "",
              style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(
            height: 5,
          ),
          Text(news.author ?? "", style: Theme.of(context).textTheme.bodySmall),
          Text(
            formatPublishedAt(news.publishedAt ?? ""),
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
