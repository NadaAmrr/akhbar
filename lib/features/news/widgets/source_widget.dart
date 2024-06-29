import 'package:akhbar/models/source.dart';
import 'package:flutter/material.dart';

class SourceItem extends StatelessWidget {
  Source source;
  bool isSelected;
  SourceItem({super.key, required this.source,required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: Theme.of(context).primaryColor,
        ),
        color: isSelected? Theme.of(context).primaryColor : Colors.transparent,
      ),
      child: Text(source.name ?? "", style: isSelected? Theme.of(context).textTheme.titleMedium : Theme.of(context).textTheme.titleMedium ),
    );
  }
}