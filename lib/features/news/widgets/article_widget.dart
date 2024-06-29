//
// import 'package:akhbar/models/article.dart';
// // import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
//
// class ArticleItem extends StatelessWidget {
//   Articles articles;
//   ArticleItem({super.key, required this.articles});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // CachedNetworkImage(
//         //   imageUrl: articles.urlToImage ?? "",
//         //   placeholder: (context, url) => CircularProgressIndicator(),
//         //   errorWidget: (context, url, error) => Icon(Icons.error),
//         // ),
//         /**   ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child:
//             Image.network(
//             articles.urlToImage ?? "",
//             height: 250,
//             fit: BoxFit.fill,
//             ),),
//          */
//         Text(
//           articles.source?.name ?? "",
//           style: Theme.of(context).textTheme.bodyLarge),
//         Text(articles.title ?? "",
//             style: Theme.of(context).textTheme.bodyLarge),
//         Text(articles.publishedAt ?? "",
//             style: Theme.of(context).textTheme.bodyLarge),
//         // Text(articles.description ?? "", style: TextStyle(fontWeight: FontManager.light, color: ColorManager.txtTertiaryLight, fontSize: 10)),
//       ],
//     );
//   }
// }