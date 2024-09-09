import 'package:flutter/material.dart';

class ImageCircle extends StatelessWidget {
  ImageCircle({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      this.image,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child; // Return the fully loaded image
        } else {
          // Show a progress indicator while the image is loading
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
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        // Handle error scenarios, like displaying a placeholder or error message
        return Text('Failed to load image');
      },
    );
  }
}
