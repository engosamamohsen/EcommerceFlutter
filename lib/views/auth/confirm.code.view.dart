import 'package:Emend/component/app_bar/app.bar.global.dart';
import 'package:Emend/component/button.global.dart';
import 'package:Emend/component/text.form.global.dart';
import 'package:Emend/cubit/auth/auth_cubit.dart';
import 'package:Emend/cubit/auth/auth_state.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/utils/global.assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/web/TMeta.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfirmCodeView extends StatelessWidget {
  ConfirmCodeView({super.key});

  final TextEditingController otpText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TMeta.keywords();

    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: GlobalAppBar(title: AppLocalizations.of(context)!.confirm_code),
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
                    Text(S
                        .of(context)
                        .please_enter_your_otp_had_been_sent_to_you),
                    const SizedBox(height: 10),
                    TextFormGlobal(
                        hint: AppLocalizations.of(context)!.otp,
                        textInputType: TextInputType.text,
                        obscureText: false,
                        controller: otpText),
                    const SizedBox(height: 30),
                    ButtonGlobal(
                      text: AppLocalizations.of(context)!.submit,
                      onTap: () {
                        if (formKey.currentState?.validate() ?? false) {
                          BlocProvider.of<AuthCubit>(context)
                              .confirmPassword("", "");
                          // Form is valid, proceed with sign in
                          print("Form is valid");
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
        },
      ),
    );
  }
}
