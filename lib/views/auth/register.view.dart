import 'package:auth/component/app_bar/app.bar.global.dart';
import 'package:auth/component/button.global.dart';
import 'package:auth/component/text.form.global.dart';
import 'package:auth/cubit/auth/auth_cubit.dart';
import 'package:auth/cubit/auth/auth_state.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/utils/global.assets.dart';
import 'package:auth/views/auth/confirm.code.view.dart';
import 'package:auth/views/home/home_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (BuildContext context) {
                return HomeContainer();
              }),
              (Route<dynamic> route) => false,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: GlobalAppBar(title: S.of(context).register),
            backgroundColor: Colors.white,
            body: SafeArea(
                child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        width: 220,
                        height: 220,
                        "${GlobalAssets.imagesAssetsPath}img_register.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(S.of(context).please_make_new_account,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 18)),
                    const SizedBox(height: 10),
                    TextFormGlobal(
                        hint: S.of(context).username,
                        textInputType: TextInputType.name,
                        obscureText: false,
                        controller: nameController),
                    const SizedBox(height: 10),
                    TextFormGlobal(
                        hint: S.of(context).email,
                        textInputType: TextInputType.emailAddress,
                        obscureText: false,
                        controller: emailController),
                    const SizedBox(height: 10),
                    TextFormGlobal(
                        hint: S.of(context).phone,
                        textInputType: TextInputType.phone,
                        obscureText: false,
                        controller: phoneController),
                    const SizedBox(height: 10),
                    TextFormGlobal(
                        hint: S.of(context).password,
                        textInputType: TextInputType.visiblePassword,
                        obscureText: true,
                        controller: passwordController),
                    const SizedBox(height: 10),
                    TextFormGlobal(
                        hint: S.of(context).confirm_password,
                        textInputType: TextInputType.visiblePassword,
                        obscureText: true,
                        controller: confirmPasswordController),
                    const SizedBox(height: 10),
                    const SizedBox(
                      height: 30,
                    ),
                    ButtonGlobal(
                      text: S.of(context).register,
                      showProgress: state is AuthLoadingState ? true : false,
                      onTap: () {
                        if (formKey.currentState?.validate() ?? false) {
                          // Form is valid, proceed with sign in
                          BlocProvider.of<AuthCubit>(context).register(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              password: passwordController.text);
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
