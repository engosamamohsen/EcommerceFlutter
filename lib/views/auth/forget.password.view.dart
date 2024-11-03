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

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TMeta.keywords();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: GlobalAppBar(
              title: AppLocalizations.of(context)!.forget_password,
            ),
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
                    Text(
                        AppLocalizations.of(context)!.please_enter_your_email_address_you_will),
                    const SizedBox(height: 10),
                    TextFormGlobal(
                        hint: AppLocalizations.of(context)!.email,
                        textInputType: TextInputType.emailAddress,
                        obscureText: false,
                        controller: emailController),
                    const SizedBox(height: 30),
                    ButtonGlobal(
                      text: AppLocalizations.of(context)!.submit,
                      showProgress: state is AuthFailedState ? true : false,
                      onTap: () {
                        if (formKey.currentState?.validate() ?? false) {
                          BlocProvider.of<AuthCubit>(context)
                              .forgetPassword(email: emailController.text);
                        }
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
