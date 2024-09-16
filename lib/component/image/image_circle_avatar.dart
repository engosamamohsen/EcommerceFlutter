import 'dart:io';

import 'package:flutter/material.dart';

class ImageCircleAvatar extends StatelessWidget {
  ImageCircleAvatar(
      {super.key,
      this.width = 150,
      this.height = 150,
      this.image = "",
      this.fileImage,
      this.click});
  double width;
  double height;

  String image;
  File? fileImage;
  void Function()? click;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: click,
      child: SizedBox(
        width: width,
        height: height,
        child: CircleAvatar(
          radius: 30.0,
          backgroundImage: fileImage != null
              ? FileImage(fileImage!)
              : image.isNotEmpty
                  ? NetworkImage(image)
                  : null,
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}
