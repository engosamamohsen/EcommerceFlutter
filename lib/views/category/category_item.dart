import 'package:auth/component/text/text_global.dart';
import 'package:auth/core/app_color.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key, required this.name, required this.image});
  String name;
  String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: Image.network(
              image,
              fit: BoxFit.cover,
              width: 60.0, // Set width and height for the image
              height: 60.0,
              errorBuilder: (context, error, stackTrace) {
                // This widget is displayed when the network image fails to load
                return Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 30,
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child; // When the image has loaded successfully
                } else {
                  // Display a loading indicator while the image is loading
                  return Center(
                    child: CircularProgressIndicator(
                      color: GlobalColors.mainColor,
                      strokeWidth: 2,
                    ),
                  );
                }
              },
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextGlobal(
          text: name,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        )
      ],
    );
  }
}
