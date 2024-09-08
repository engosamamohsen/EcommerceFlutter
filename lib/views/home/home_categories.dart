import 'package:auth/models/category/category_model.dart';
import 'package:auth/views/category/category_item.dart';
import 'package:flutter/material.dart';

class HomeCategories extends StatelessWidget {
  HomeCategories({super.key, this.categories = const []});

  List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            print("category:${category.name}");
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CategoryItem(name: category.name, image: category.icon),
            );
          }),
    );
  }
}