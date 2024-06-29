import 'package:akhbar/models/ArticlesResponse.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticleItemWidget extends StatelessWidget {
  Articles news;
  ArticleItemWidget({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.07),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 3, color: Theme.of(context).primaryColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: news.urlToImage ?? "",
            placeholder: (context, url) => Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,)),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          //   ClipRRect(
          //     borderRadius: BorderRadius.circular(12),
          //     child:
          //     Image.network(
          //     news.urlToImage ?? "",
          //     height: 250,
          //     fit: BoxFit.fill,
          //     ),),
          Text(news.author ?? "",
              style: Theme.of(context).textTheme.titleMedium),
          Text(news.title ?? "", style: Theme.of(context).textTheme.bodyLarge),
          Text(news.description ?? "",
              style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
