import 'package:auth/component/text_global.dart';
import 'package:auth/core/app_color.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/views/home/products/product_item.dart';
import 'package:flutter/material.dart';

class HomeCategoryProduct extends StatelessWidget {
  const HomeCategoryProduct({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextGlobal(
              text: title,
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            TextGlobal(
              text: S.of(context).see_all,
              fontSize: 14,
              color: GlobalColors.mainColor,
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 350, // Adjust height based on the product item height
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6, // Adjust this to the actual number of products
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProductItemView(),
              );
            },
          ),
        ),
      ],
    );
  }
}
