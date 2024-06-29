import 'package:akhbar/core/theme/theme_provider.dart';
import 'package:akhbar/core/utils/app_assets.dart';
import 'package:akhbar/core/utils/app_colors.dart';
import 'package:akhbar/features/categories/categories_tab.dart';
import 'package:akhbar/features/home/widgets/drawer_app_widget.dart';
import 'package:akhbar/features/news/news_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
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
        // drawer: DrawerWidget(),
        drawer: Drawer(
          backgroundColor: Theme.of(context).primaryColor,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(12)),
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Mode",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                CupertinoSwitch(
                    value: provider.isDarkMode,
                    onChanged: (value) {
                      provider.toggleTheme();
                    }),
                // sss
              ],
            ),
          ),
        ),
        body: NewsTab(),
      ),
    );
  }
  // late Widget bodyWidget;

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
