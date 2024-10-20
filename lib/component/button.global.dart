import 'package:Emend/utils/constants/color.dart';
import 'package:flutter/material.dart';

class ButtonGlobal extends StatelessWidget {
  const ButtonGlobal(
      {super.key,
      required this.text,
      this.onTap,
      this.radius = 6,
      this.padding = 10,
      this.fontSize = 18,
      this.height = 50,
      this.showProgress = false});
  final String text;
  final bool showProgress;
  final double radius;
  final double padding;
  final double fontSize;
  final VoidCallback? onTap;
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
          child: Wrap(
        children: [
          Container(
            alignment: Alignment.center,
            height: height,
            decoration: BoxDecoration(
                color: TColor.primary,
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6)
                ]),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: padding,
                ),
                if (showProgress)
                  const SizedBox(
                    height: 32, // Smaller size for the progress indicator
                    width: 32,
                    child: CircularProgressIndicator(
                        color: Colors.white, strokeWidth: 2),
                  ),
                if (showProgress) const SizedBox(width: 8),
                Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: fontSize),
                ),
                SizedBox(
                  width: padding,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
