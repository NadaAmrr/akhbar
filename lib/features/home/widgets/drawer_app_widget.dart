
import 'package:akhbar/core/enums/drawer_enum.dart';
import 'package:akhbar/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef OnDrawerItemClicked = void Function(DrawerMenuItem drawerMenuItem);
class DrawerWidget extends StatelessWidget {
  static const int category = 1;
  static const int settings = 2;
  static const int sources = 3;
  OnDrawerItemClicked onDrawerItemClicked;
  DrawerWidget({
    required this.onDrawerItemClicked,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      alignment: Alignment.center,
      child: Text(
        AppLocalizations.of(context)!.appName,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Column(
      children: [
        InkWell(
            onTap: () {
              onDrawerItemClicked(DrawerMenuItem.category);
            },
            child: buildListTile(title: "Categories", icon: Icons.list)),
        InkWell(
            onTap: () {
              onDrawerItemClicked(DrawerMenuItem.settings);
            },
            child: buildListTile(title: "Settings", icon: Icons.settings)),
        InkWell(
            onTap: () {
              onDrawerItemClicked(DrawerMenuItem.sources);
            },
            child: buildListTile(title: "Sources", icon: Icons.newspaper)),
      ],
    );
  }

  Widget buildListTile({required String title, required IconData icon, context}) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.txtPrimaryLight,
        size: 40,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge
      ),
    );
  }
}

