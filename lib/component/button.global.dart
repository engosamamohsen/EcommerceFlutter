import 'package:auth/core/app_color.dart';
import 'package:flutter/material.dart';

class ButtonGlobal extends StatelessWidget {
  const ButtonGlobal(
      {super.key,
      required this.text,
      this.onTap,
      this.width = 200,
      this.showProgress = false});
  final String text;
  final bool showProgress;
  final double width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: Container(
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
              color: GlobalColors.mainColor,
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6)
              ]),
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
