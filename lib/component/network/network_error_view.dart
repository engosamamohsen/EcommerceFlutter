import 'package:auth/component/text_global.dart';
import 'package:auth/generated/l10n.dart';
import 'package:flutter/material.dart';

class NetworkError extends StatelessWidget {
  const NetworkError({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextGlobal(
                  text: S.of(context).network_error,
                  maxLines: 2,
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold)
            ],
          ),
        ));
  }
}
