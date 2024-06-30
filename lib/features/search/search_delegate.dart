import 'package:akhbar/core/theme/app_theme.dart';
import 'package:akhbar/core/theme/theme_provider.dart';
import 'package:akhbar/features/home/provider/home_provider.dart';
import 'package:akhbar/features/news/news_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SearchTab extends SearchDelegate {
  final ThemeProvider provider;
  final HomeProvider providerHome;

  SearchTab(this.provider, this.providerHome);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: const Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    return query.isEmpty
        ? Center(
            child: Text(AppLocalizations.of(context)!.searching,
                style: Theme.of(context).textTheme.titleLarge))
        : NewsTab(
            categoryModel: providerHome.selectedCategory!,
            query: query,
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    /// before search and after search
    return Center(
        child: Text(AppLocalizations.of(context)!.searching,
            style: Theme.of(context).textTheme.titleLarge));
    // return SuggestionsWidget(query: query);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return provider.themeData!.copyWith(
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: Theme.of(context).textTheme.bodySmall,
            fillColor: Theme.of(context).colorScheme.secondary,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            counterStyle: Theme.of(context).textTheme.bodySmall,
            filled: true,
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            disabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))));
  }
}
