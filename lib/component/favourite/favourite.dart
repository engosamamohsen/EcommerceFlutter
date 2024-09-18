import 'package:auth/core/app_color.dart';
import 'package:flutter/material.dart';

class FavoriteCell extends StatelessWidget {
  FavoriteCell(
      {super.key,
      this.isFavourite = false,
      this.size = 60,
      required this.submit});

  bool isFavourite;
  double size;
  Function submit;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade300,
      radius: 20,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          isFavourite ? Icons.favorite : Icons.favorite_border,
          color: isFavourite ? GlobalColors.mainColor : Colors.grey,
          size: size,
        ),
        color: Colors.grey.shade300,
        onPressed: () {
          submit();
        },
      ),
    );
  }
}
