import 'package:flutter/material.dart';

class DividerGlobal extends StatelessWidget {
  DividerGlobal({super.key, this.thickness = 1.0});

  double thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey,
      height: 1,
      thickness: thickness,
    );
  }
}
