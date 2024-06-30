import 'package:akhbar/features/article/widgets/article_details_widget.dart';
import 'package:akhbar/models/ArticlesResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArticleScreen extends StatelessWidget {
  static const String routeName = "article";
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Articles article = ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        title: Text( AppLocalizations.of(context)!.appName ),
      ),
      body: ArticleDetailsWidget(article: article,)
    );
  }
}
