import 'package:flutter/material.dart';

class ImageRound extends StatelessWidget {
  const ImageRound({super.key, required this.image, required this.round});
  final String image;
  final double round;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(round), // Border radius of 10
          image: DecorationImage(
            image: NetworkImage(image), // Replace with your image URL
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
