import 'package:akhbar/core/theme/theme_provider.dart';
import 'package:akhbar/core/utils/app_assets.dart';
import 'package:akhbar/features/categories/categories_tab.dart';
import 'package:akhbar/features/home/provider/home_provider.dart';
import 'package:akhbar/features/home/widgets/drawer_widget.dart';
import 'package:akhbar/features/news/news_tab.dart';
import 'package:akhbar/features/search/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var providerHome = Provider.of<HomeProvider>(context);
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
          title: Text(providerHome.selectedCategory == null ? AppLocalizations.of(context)!.appName : providerHome.selectedCategory!.title),
          actions: [
            providerHome.selectedCategory == null ? const SizedBox() : IconButton(onPressed: () {
              showSearch(context: context, delegate: SearchTab(provider, providerHome));
            }, icon: const Icon(Icons.search))
          ],
        ),
        drawer: DrawerWidget(
          provider: provider,
          onDrawerItemClicked: providerHome.onDrawerItemClick,
        ),
        body: providerHome.selectedCategory == null
            ? CategoriesTab(
                onCategoryItemClicked: providerHome.onCategoryItemClicked,
              )
            : NewsTab(categoryModel: providerHome.selectedCategory!, query: '',),
      ),
    );
  }
}
