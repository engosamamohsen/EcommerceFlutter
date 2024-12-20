import 'package:Emend/utils/constants/color.dart';
import 'package:Emend/component/app_bar/app.bar.global.dart';
import 'package:Emend/component/button.global.dart';
import 'package:Emend/component/text.form.global.dart';
import 'package:Emend/cubit/auth/auth_cubit.dart';
import 'package:Emend/cubit/auth/auth_state.dart';
import 'package:Emend/db_helper/app_storage.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/models/login/login_response.dart';
import 'package:Emend/network/api_service.dart';
import 'package:Emend/network/end_point.dart';
import 'package:Emend/utils/global.assets.dart';
import 'package:Emend/views/auth/forget.password.view.dart';
import 'package:Emend/views/auth/register.view.dart';
import 'package:Emend/views/home/home_container.dart';
import 'package:Emend/views/home/home_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../app/routes/const_routes_url.dart';
import '../../app/routes/get_app_route.dart';
// import '../../restart/routes/navigate_app_route.dart';
import '../../widget/web/TMeta.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  AppStorageShared appStorage = AppStorageShared();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TMeta.keywords();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            GetAppRoute.push(context, RouteUrlConst.HOME,
                removePrev: true);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
                child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15.0),
              child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          width: 220,
                          height: 220,
                          "${GlobalAssets.imagesAssetsPath}img_login.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(AppLocalizations.of(context)!.login_to_your_account,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18)),
                      const SizedBox(height: 10),
                      TextFormGlobal(
                          hint: AppLocalizations.of(context)!.email,
                          textInputType: TextInputType.emailAddress,
                          obscureText: false,
                          controller: emailController),
                      const SizedBox(height: 10),
                      TextFormGlobal(
                          hint: AppLocalizations.of(context)!.password,
                          textInputType: TextInputType.visiblePassword,
                          obscureText: true,
                          controller: passwordController),
                      const SizedBox(
                        height: 30,
                      ),
                      ButtonGlobal(
                        showProgress: state is AuthLoadingState ? true : false,
                        text: AppLocalizations.of(context)!.sign_in,
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            // Form is valid, proceed with sign in
                            //call api
                            BlocProvider.of<AuthCubit>(context).login(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      Center(
                          child: Text.rich(TextSpan(children: [
                        TextSpan(text: AppLocalizations.of(context)!.dont_have_account),
                        TextSpan(
                            text: AppLocalizations.of(context)!.sign_up,
                            style: TextStyle(
                                color: TColor.primary,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return RegisterView();
                                }));
                              }),
                      ]))),
                      Container(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return ForgetPasswordView();
                            }));
                          },
                          child: Text(AppLocalizations.of(context)!.forget_password,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: TColor.secondary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  )),
            )),
          );
        },
      ),
    );
  }
}
