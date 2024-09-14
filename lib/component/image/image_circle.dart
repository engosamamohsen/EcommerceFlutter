import 'package:flutter/material.dart';

class ImageCircle extends StatelessWidget {
  ImageCircle({
    super.key,
    required this.image,
    this.width = 150,
    this.height = 150,
  });

  final String image;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
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
          return const Icon(Icons.error, size: 50); // Placeholder for errors
        },
      ),
    );
  }
}
