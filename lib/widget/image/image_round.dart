import 'package:Emend/component/network/loader_view.dart';
import 'package:Emend/component/network/loading_view_full.dart';
import 'package:Emend/utils/global.assets.dart';
import 'package:flutter/material.dart';

class ImageRound extends StatefulWidget {
  ImageRound(
      {super.key,
      required this.image,
      this.width = 150,
      this.height = 150,
      required this.round});
  final String image;
  final double round;
  final double width;
  final double height;

  @override
  State<ImageRound> createState() => _ImageRoundState();
}

class _ImageRoundState extends State<ImageRound> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      // decoration: BoxDecoration(
      //   borderRadius:
      //       BorderRadius.circular(widget.round), // Border radius of 10
      //   image: DecorationImage(
      //     image: NetworkImage(widget.image), // Replace with your image URL
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(widget.round),
            child: Image.network(
              widget.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              loadingBuilder: (context, child, progress) {
                if (progress == null) {
                  return child; // Image loaded
                } else {
                  // Show a loading spinner while the image is loading
                  return Center(
                    child: LoadingView(),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Image.asset(
                    width: widget.width,
                    height: widget.height,
                    "${GlobalAssets.imagesAssetsPath}no_image.jpg",
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
