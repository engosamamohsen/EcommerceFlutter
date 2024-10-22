import 'package:flutter/material.dart';

import '../../utils/global.assets.dart';

class TImageCircle extends StatelessWidget {
  TImageCircle(
      {super.key,
      required this.image,
      this.width = 150,
      this.height = 150,
      this.click});

  final String image;
  final double width;
  final double height;
  final Function()? click;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: click,
      child: ClipOval(
        child: Image.network(
          image,
          width: width,
          height: height,
          fit: BoxFit.cover, // Ensures the image fits within the circle
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child; // Return the fully loaded image
            } else {
              // Show a progress indicator while the image is loading
              return SizedBox(
                width: width,
                height: height,
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                ),
              );
            }
          },
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            // Handle error scenarios, like displaying a placeholder or error message
            return Center(
              child: Image.asset(
                width: (width + height)/2,
                height: (width + height)/2,
                "${GlobalAssets.imagesAssetsPath}no_image.jpg",
                fit: BoxFit.cover,
              ),
            ); // Placeholder for errors
          },
        ),
      ),
    );
  }
}

