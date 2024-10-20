import 'package:Emend/utils/constants/color.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: TColor.primary,
      strokeWidth: 1,
    ));
  }
}
