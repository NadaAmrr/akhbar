import 'package:akhbar/core/theme/theme_provider.dart';
import 'package:akhbar/features/home/widgets/lang_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  static const int category = 0;
  DrawerWidget({
    super.key,
    required this.provider,
    required this.onDrawerItemClicked,
  });

  final ThemeProvider provider;
  Function onDrawerItemClicked;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LangProvider>(context);

    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(context),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        onDrawerItemClicked(category, context);
                      },
                      child: buildListTile(
                          title: AppLocalizations.of(context)!.category,
                          icon: Icons.category,
                          context: context)),
                  ListTile(
                    title: Text(AppLocalizations.of(context)!.lang,style: Theme.of(context).textTheme.titleLarge),
                    trailing: DropdownButton<Locale>(
                      iconSize: 40,
                      dropdownColor: Theme.of(context).colorScheme.secondary,
                      iconEnabledColor: Theme.of(context).colorScheme.secondary,
                      value: Localizations.localeOf(context),
                      onChanged: (Locale? newLocale) {
                          provider.changeLang(newLocale!.languageCode);
                      },
                      items:  [
                        DropdownMenuItem(
                          value: const Locale('en'),
                          child: Text(AppLocalizations.of(context)!.en, style: Theme.of(context).textTheme.titleLarge,),
                        ),
                        DropdownMenuItem(
                          value: const Locale('ar'),
                          child: Text(AppLocalizations.of(context)!.ar, style: Theme.of(context).textTheme.titleLarge,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      color: Theme.of(context).colorScheme.onPrimary,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            AppLocalizations.of(context)!.appName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.darkMode,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              CupertinoSwitch(
                  value: provider.isDarkMode,
                  onChanged: (value) {
                    provider.toggleTheme();
                  }),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildListTile(
      {required String title,
      required IconData icon,
      required BuildContext context}) {
    return ListTile(
      trailing: Icon(
        icon,
        color: Theme.of(context).colorScheme.onSecondary,
        size: 40,
      ),
      title: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }
}
