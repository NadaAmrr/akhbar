

import 'package:akhbar/core/utils/app_assets.dart';
import 'package:akhbar/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String title;
  Color color;
  String imagePath;
  CategoryModel({required this.id, required this.title,required this.color,required this.imagePath});
  static getCategories () {
    return [
      CategoryModel(id: 'sports', title: 'Sports', color: AppColors.sport, imagePath: AppAssets.imgSports),
      CategoryModel(id: 'general', title: 'Politics', color: AppColors.politics, imagePath: AppAssets.imgPolitics),
      CategoryModel(id: 'health', title: 'Health', color: AppColors.health, imagePath: AppAssets.imgHealth),
      CategoryModel(id: 'business', title: 'Business', color: AppColors.business, imagePath: AppAssets.imgBusiness),
      CategoryModel(id: 'entertainment', title: 'Environment', color: AppColors.environment, imagePath: AppAssets.imgEnvironment),
      CategoryModel(id: 'science', title: 'Science', color: AppColors.science, imagePath: AppAssets.imgScience),
      CategoryModel(id: 'technology', title: 'Technology', color: AppColors.technology, imagePath: AppAssets.imgTechnology),
    ];
  }
}