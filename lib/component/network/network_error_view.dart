import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                  text: AppLocalizations.of(context)!.network_error,
                  maxLines: 2,
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold)
            ],
          ),
        ));
  }
}
