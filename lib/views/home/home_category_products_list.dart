import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/models/category/category_model.dart';
import 'package:Emend/utils/constants/color.dart';
import 'package:Emend/cubit/product/product_cubit.dart';
import 'package:Emend/cubit/product/product_state.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/models/product/product_model.dart';
import 'package:Emend/views/home/home_category_product.dart';
import 'package:Emend/views/products/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/web/TMeta.dart';

class HomeCategoryProductsList extends StatelessWidget {
  HomeCategoryProductsList(
      {super.key,
      required this.categories,
      required this.productStates,
      required this.productIdFav,
      required this.submitFavourite});

  int productIdFav;
  List<CategoryModel> categories = [];
  ProductStates productStates;
  final Function(int productId) submitFavourite;

  @override
  Widget build(BuildContext context) {
    TMeta.keywords();
    return Column(
      children: [
        SizedBox(
          height: categories
              .length * 250, // Adjust height based on the product item height
          child: ListView.builder(
            // shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: categories
                .length, // Adjust this to the actual number of products
            itemBuilder: (context, indexCategory) {
              return HomeCategoryProduct(
                  title: categories[indexCategory].name,
                  products: categories[indexCategory].products,
                  productStates: productStates,
                  productIdFav: productIdFav,
                  submitFavourite: submitFavourite);
            },
          ),
        )
      ],
    );
  }
}
