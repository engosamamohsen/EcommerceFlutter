import 'package:Emend/app/navigate_app.dart';
import 'package:Emend/component/favourite/favourite.dart';
import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/app/app_color.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/models/product/product_model.dart';
import 'package:Emend/utils/global.assets.dart';
import 'package:Emend/views/products/product_details.dart';
import 'package:flutter/material.dart';

class ProductItemView extends StatelessWidget {
  ProductItemView(
      {super.key,
      required this.product,
      this.width = 120,
      this.height = 120,
      required this.showProgres,
      required this.submitFavourite});
  final ProductModel product;
  final double width;
  final double height;
  Function(int productId) submitFavourite;
  bool showProgres;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigateApp.navigate(
            context,
            ProductDetailsView(
              productId: product.id,
            ));
      },
      child: Card(
        color: Colors.white,
        elevation: 5, // Controls the shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),

        child: Container(
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
                ),
                Positioned(
                    top: 10,
                    right: 20,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: FavoriteCell(
                        size: 30,
                        showProgress: showProgres,
                        isFavourite: product.isLike,
                        submit: () {
                          submitFavourite(product.id);
                        },
                      ),
                    )),
              ],
            ),
            SizedBox(height: 10),
            TextGlobal(
              text: product.name,
              maxLines: 2,
              fontSize: 14,
              textAlign: TextAlign.center,
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
        ),
      ),
    );
  }
}
