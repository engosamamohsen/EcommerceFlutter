import 'package:auth/component/text_global.dart';
import 'package:auth/core/app_color.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/models/product/product_model.dart';
import 'package:auth/utils/global.assets.dart';
import 'package:flutter/material.dart';

class ProductItemView extends StatelessWidget {
  ProductItemView(
      {super.key, required this.product, this.width = 120, this.height = 120});
  final ProductModel product;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(children: [
        Stack(
          children: [
            Center(
              child: Image.network(
                width: width,
                height: height,
                product.image, // Your image URL
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // Return the image once it's loaded
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Image.asset(
                      width: width,
                      height: height,
                      "${GlobalAssets.imagesAssetsPath}no_image.png"); // Display an error message if loading fails
                },
                fit: BoxFit
                    .cover, // Optional: Adjust the image to fit within its container
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        TextGlobal(
          text: product.name,
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        SizedBox(height: 5),
        TextGlobal(
          text: "${product.price} ${S.of(context).currency}",
          maxLines: 2,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: GlobalColors.mainColor,
        )
      ]),
    );
  }
}