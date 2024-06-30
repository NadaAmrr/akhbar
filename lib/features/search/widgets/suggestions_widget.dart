import 'package:akhbar/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SuggestionsWidget extends StatelessWidget {
  const SuggestionsWidget({
    super.key,
    required this.query,
  });

  final String query;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppLocalizations.of(context)!.suggestions,style: Theme.of(context).textTheme.titleLarge,),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TextButton(
                child: Text("bleacher", style: Theme.of(context).textTheme.titleLarge,),
                onPressed: () {
                  query == "bleacher";
                },
              );
            },
            itemCount: 1,
          ),
        ),
      ],
    );
  }
}
