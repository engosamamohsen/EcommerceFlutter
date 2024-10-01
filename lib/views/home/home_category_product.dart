import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/app/app_color.dart';
import 'package:Emend/cubit/product/product_cubit.dart';
import 'package:Emend/cubit/product/product_state.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/models/product/product_model.dart';
import 'package:Emend/views/products/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCategoryProduct extends StatelessWidget {
  HomeCategoryProduct(
      {super.key,
      required this.title,
      required this.products,
      required this.productStates,
      required this.productIdFav,
      required this.submitFavourite});

  final String title;
  int productIdFav;
  List<ProductModel> products = [];
  ProductStates productStates;
  final Function(int productId) submitFavourite;

  @override
  Widget build(BuildContext context) {
    print("state category product $productStates , $productIdFav");
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextGlobal(
              text: title,
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            // TextButton(
            //   style: TextButton.styleFrom(
            //     overlayColor: GlobalColors.mainColor,
            //   ),
            //   onPressed: () {},
            //   child: TextGlobal(
            //     fontWeight: FontWeight.bold,
            //     text: S.of(context).see_all,
            //     fontSize: 14,
            //     color: GlobalColors.mainColor,
            //   ),
            // ),
          ],
        ),
        SizedBox(
          height: 200, // Adjust height based on the product item height
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                products.length, // Adjust this to the actual number of products
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProductItemView(
                  product: products[index],
                  showProgres: productStates is ProductLoadingWishlistState &&
                      productIdFav == products[index].id,
                  submitFavourite: (productId) {
                    submitFavourite(productId);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
