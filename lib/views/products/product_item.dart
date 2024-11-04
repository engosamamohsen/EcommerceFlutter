import 'package:Emend/app/navigate_app.dart';
import 'package:Emend/app/routes/const_routes_url.dart';
// import 'package:Emend/restart/routes/navigate_app_route.dart';
import 'package:Emend/component/favourite/favourite.dart';
import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/utils/constants/color.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/models/product/product_model.dart';
import 'package:Emend/utils/global.assets.dart';
import 'package:Emend/views/products/product_details.dart';
import 'package:flutter/material.dart';

import '../../app/routes/get_app_route.dart';
import '../../widget/web/TMeta.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    TMeta.keywords();

    return InkWell(
      onTap: () {
        GetAppRoute.push(context, RouteUrlConst.PRODUCT_DETAILS, parameter: {'product_id': product.id.toString()});
      },
      child: SizedBox(
        width: width,
        height: height,
        child: Container(
          decoration: BoxDecoration(
            color: TColor.primary.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: Colors.white,
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter
            )
          ),
          // color: Colors.black,
          // elevation: 5,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(10),
          // ),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Center( // Center content in the container
            child: Column(
              mainAxisSize: MainAxisSize.min, // Minimize extra space
              children: [
                Stack(
                  children: [
                    Center(
                      child: Image.network(
                        width: width,
                        height: height,
                        fit: BoxFit.cover,
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQewqlMUCJQxvGDmgIvhRGs7vXcK1_uw6zYZhh_YnG65iUWYnSZEMIJjkxAHS529EgnkBIP&s",
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
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
                        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                          return Image.asset(
                            width: width,
                            height: height,
                            "${GlobalAssets.imagesAssetsPath}no_image.png",
                          );
                        },
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
                      ),
                    ),
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
                  text: "${product.price} ${AppLocalizations.of(context)!.currency}",
                  maxLines: 2,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: TColor.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
