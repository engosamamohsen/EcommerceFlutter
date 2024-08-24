import 'package:auth/component/app.bar.global.dart';
import 'package:auth/component/button.global.dart';
import 'package:auth/component/text.form.global.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/utils/global.assets.dart';
import 'package:flutter/material.dart';

class ConfirmCodeView extends StatelessWidget {
  ConfirmCodeView({super.key});

  final TextEditingController otpText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: const GlobalAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),

        alignment: Alignment.center,
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  width: 220,
                  height: 220,
                  "${GlobalAssets.imagesAssetsPath}img_otp.png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(S.of(context).please_enter_your_otp_had_been_sent_to_you),
              const SizedBox(height: 10),
               TextFormGlobal(
                  hint: S.of(context).otp,
                  textInputType: TextInputType.text,
                  obscureText: false,
                  controller: otpText),
              const SizedBox(height: 30),
                  ButtonGlobal(
                text: S.of(context).submit,
                onTap: () {
                  if (formKey.currentState?.validate() ?? false) {
                    // Form is valid, proceed with sign in
                    print("Form is valid");
                  } else {
                    // Form is not valid, show errors
                    print("Form is not valid");
                  }
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (BuildContext context) {
                  //   return ConfirmCodeView();
                  // }));
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
