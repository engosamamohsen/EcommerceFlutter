import 'package:auth/component/app.bar.global.dart';
import 'package:auth/component/button.global.dart';
import 'package:auth/component/text.form.global.dart';
import 'package:auth/cubit/auth/auth_cubit.dart';
import 'package:auth/cubit/auth/auth_state.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/utils/global.assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
        builder: (context, state) {
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
                    Text(
                        S.of(context).please_enter_your_email_address_you_will),
                    const SizedBox(height: 10),
                    TextFormGlobal(
                        hint: S.of(context).email,
                        textInputType: TextInputType.emailAddress,
                        obscureText: false,
                        controller: emailController),
                    const SizedBox(height: 30),
                    ButtonGlobal(
                      text: S.of(context).submit,
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
