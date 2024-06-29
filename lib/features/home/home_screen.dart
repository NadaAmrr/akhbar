import 'package:akhbar/core/utils/app_assets.dart';
import 'package:akhbar/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        // body: bodyWidget,
      ),
    );
  }
}
