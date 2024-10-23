import 'package:Emend/models/category/category_model.dart';
import 'package:Emend/views/category/category_item.dart';
import 'package:flutter/material.dart';

import '../../widget/web/TMeta.dart';

class HomeCategories extends StatelessWidget {
  HomeCategories({super.key, this.categories = const []});

  List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    TMeta.keywords();

    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: CategoryItem(
                  categoryId: category.id,
                  name: category.name,
                  image: category.icon),
            );
          }),
    );
  }
}
