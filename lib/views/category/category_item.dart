import 'package:Emend/app/navigate_app.dart';
import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/utils/constants/color.dart';
import 'package:Emend/utils/global.assets.dart';
import 'package:Emend/views/products/product_list_view.dart';
import 'package:flutter/material.dart';

import '../../app/routes/const_routes_url.dart';
import '../../app/routes/navigate_app_route.dart';
class CategoryItem extends StatelessWidget {
  CategoryItem({
    super.key,
    required this.categoryId,
    required this.name,
    required this.image,
  });

  int categoryId;
  String name;
  String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // NavigateApp.navigate(context, ProductListView(categoryId: categoryId));
        // GetAppRoute.push(context, "${RouteUrlConst.PRODUCT_LIST}?id=$categoryId&name=$name");

        print("category $categoryId , $name");
        // GetAppRoute.push(
        //     context,
        //     "${RouteUrlConst.PRODUCT_LIST}?id=$categoryId&name=$name"
        // );
      },
      child: SizedBox(
        width: 100,  // Set fixed width to avoid big square issue
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: 60.0,
                  height: 60.0,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Image.asset(
                        width: 60,
                        height: 60,
                        "${GlobalAssets.imagesAssetsPath}no_image.jpg",
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: TColor.primary,
                          strokeWidth: 2,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 8), // Space between image and text
            SizedBox(
              width: 80,  // Constrain text width
              child: TextGlobal(
                text: name,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                textAlign: TextAlign.center, // Align text center
                maxLines: 2, // Prevent text overflow
              ),
            ),
          ],
        ),
      ),
    );
  }
}
