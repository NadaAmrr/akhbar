
import 'package:akhbar/models/ArticlesResponse.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArticleDetailsWidget extends StatelessWidget {
  Articles article;
  ArticleDetailsWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    String formatPublishedAt(String dateStr) {
      DateTime dateTime = DateTime.parse(dateStr);
      return DateFormat('MMMM dd, yyyy h:mm a').format(dateTime);
    }

    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.07),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 3, color: Theme.of(context).primaryColor),
      ),
      child: SingleChildScrollView(
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
                article.urlToImage ?? "",
                height: 250,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(article.title ?? "",
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(
              height: 5,
            ),
            Text(article.description ?? "",
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(
              height: 5,
            ),
            Text(article.content ?? "",
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(
              height: 5,
            ),
            Text(article.author ?? "", style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.end),
            Text(
              formatPublishedAt(article.publishedAt ?? ""),
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}