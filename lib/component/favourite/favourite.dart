import 'package:Emend/app/app_color.dart';
import 'package:flutter/material.dart';

class FavoriteCell extends StatelessWidget {
  FavoriteCell(
      {super.key,
      this.isFavourite = false,
      this.size = 60,
      this.showProgress = false,
      required this.submit});

  bool isFavourite;
  bool showProgress;
  double size;
  Function submit;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade300,
      radius: 20,
      child: showProgress
          ? CircularProgressIndicator(
              color: GlobalColors.mainColor,
              strokeWidth: 1,
            )
          : IconButton(
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
