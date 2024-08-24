import 'package:auth/component/app.bar.global.dart';
import 'package:auth/component/button.global.dart';
import 'package:auth/component/text.form.global.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/utils/global.assets.dart';
import 'package:auth/views/auth/confirm.code.view.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});

  final TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
        final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const GlobalAppBar(),
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
                  "${GlobalAssets.imagesAssetsPath}img_forgot_password.png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(S.of(context).please_enter_your_email_address_you_will),
              const SizedBox(height: 10),
               TextFormGlobal(
                  hint: S.of(context).email,
                  textInputType: TextInputType.emailAddress,
                  obscureText: false,
                  controller: emailController),
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
