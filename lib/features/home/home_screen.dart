import 'package:akhbar/core/utils/app_assets.dart';
import 'package:akhbar/core/utils/app_colors.dart';
import 'package:akhbar/features/home/widgets/drawer_app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppAssets.imgBackground),
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.appName),
        ),
        // drawer: DrawerWidget(onDrawerItemClicked: onDrawerClick),
        body: bodyWidget,
      ),
    );
  }
  late Widget bodyWidget;

  // onDrawerClick(DrawerMenuItem item) {
  //   switch (item) {
  //     case DrawerMenuItem.category:
  //       setState(() {
  //         bodyWidget =  CategoryTab(onCategoryItemClicked: onCategoryItemClicked);
  //         titleGlobal = "News";
  //       });
  //     case DrawerMenuItem.settings:
  //       setState(() {
  //         bodyWidget = const SettingsTab();
  //         titleGlobal = "News";
  //       });
  //     case DrawerMenuItem.sources:
  //       setState(() {
  //         bodyWidget = SourcesTab();
  //         titleGlobal = "News";
  //       });
  //   }
  // }
  // void onCategoryItemClicked (Category category) {
  //   bodyWidget = CategoryDetails(category: category, onArticleItemClicked: onArticleItemClicked,);
  //   setState(() {
  //     titleGlobal = "News";
  //   });
  // }
  //
  // void onArticleItemClicked (Articles article) {
  //   bodyWidget = ArticleDetails(article: article);
  //   setState(() {
  //     titleGlobal = article.title ?? "";
  //   });
  // }
  //
  // void onSourceItemClicked () {
  //   bodyWidget = SourcesTab();
  //   setState(() {});
  // }
}
