

import 'package:akhbar/core/utils/app_assets.dart';
import 'package:akhbar/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryModel {
  String id;
  String title;
  Color color;
  String imagePath;
  CategoryModel({ required this.id, required this.title,required this.color,required this.imagePath});
  static getCategories (BuildContext context) {
    return [
      CategoryModel(id: 'sports', title: AppLocalizations.of(context)!.sports, color: AppColors.sport, imagePath: AppAssets.imgSports),
      CategoryModel(id: 'general', title: AppLocalizations.of(context)!.general, color: AppColors.politics, imagePath: AppAssets.imgPolitics),
      CategoryModel(id: 'health', title: AppLocalizations.of(context)!.health, color: AppColors.health, imagePath: AppAssets.imgHealth),
      CategoryModel(id: 'business', title: AppLocalizations.of(context)!.business, color: AppColors.business, imagePath: AppAssets.imgBusiness),
      CategoryModel(id: 'entertainment', title: AppLocalizations.of(context)!.entertainment, color: AppColors.environment, imagePath: AppAssets.imgEnvironment),
      CategoryModel(id: 'science', title: AppLocalizations.of(context)!.science, color: AppColors.science, imagePath: AppAssets.imgScience),
      CategoryModel(id: 'technology', title: AppLocalizations.of(context)!.technology, color: AppColors.technology, imagePath: AppAssets.imgTechnology),
    ];
  }
}