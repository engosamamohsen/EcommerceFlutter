import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  StarRating(
      {super.key,
      this.rating = 0.0,
      this.starCount = 5,
      this.size = 30,
      this.color = Colors.amber});
  double rating; // Current rating (can have decimal values for half stars)
  int starCount; // Total number of stars
  Color color;
  double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        // Check if the star should be full, half, or empty
        IconData icon;
        if (index < rating.floor()) {
          icon = Icons.star; // Full star
        } else if (index < rating && rating % 1 != 0) {
          icon = Icons.star_half; // Half star
        } else {
          icon = Icons.star_border; // Empty star
        }
        return Icon(
          icon,
          color: color,
          size: size,
        );
      }),
    );
  }
}
