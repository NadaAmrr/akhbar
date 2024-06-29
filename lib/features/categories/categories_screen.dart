import 'package:akhbar/features/categories/widgets/category_widget.dart';
import 'package:akhbar/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesScreen extends StatelessWidget {

   const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categoriesList = CategoryModel.getCategories(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(35),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                AppLocalizations.of(context)!.categoryTitle,
                style: Theme.of(context).textTheme.titleLarge
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
                itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        // onCategoryItemClicked(categoriesList[index]);
                      },
                      child: CategoryItem(
                          category: categoriesList[index], index: index),
                    );
                },
                itemCount: categoriesList.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
