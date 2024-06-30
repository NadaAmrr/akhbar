
import 'package:akhbar/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel category;
  int index;
  CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
              topRight: const Radius.circular(25),
              topLeft: const Radius.circular(25),
              bottomLeft: Radius.circular(index.isEven ? 25 : 0),
              bottomRight: Radius.circular(index.isEven ? 0 : 25))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(category.imagePath, height: MediaQuery.of(context).size.height * 0.08,),
          Text(category.title, style: Theme.of(context).textTheme.titleLarge,),
        ],
      ),
    );
  }
}