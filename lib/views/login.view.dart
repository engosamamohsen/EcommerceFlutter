import 'package:auth/component/app.bar.global.dart';
import 'package:auth/component/button.global.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/utils/global.assets.dart';
import 'package:auth/utils/global.colors.dart';
import 'package:auth/component/text.form.global.dart';
import 'package:auth/views/forget.password.view.dart';
import 'package:auth/views/register.view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15.0),
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
                "${GlobalAssets.imagesAssetsPath}img_login.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            Text(S.of(context).login_to_your_account,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 18)),
            const SizedBox(height: 10),
            TextFormGlobal(
                hint: S.of(context).email,
                textInputType: TextInputType.emailAddress,
                obscureText: false,
                controller: emailController),
            const SizedBox(height: 10),
            TextFormGlobal(
                hint: S.of(context).password,
                textInputType: TextInputType.visiblePassword,
                obscureText: true,
                controller: passwordController),
            const SizedBox(height: 10),
            const SizedBox(
              height: 30,
            ),
            ButtonGlobal(
              text: S.of(context).sign_in,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return RegisterView();
                }));
              },
            ),
            const SizedBox(height: 30),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const ForgetPasswordView();
                  }));
                },
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(S.of(context).create_new_account,
                          style: TextStyle(
                              color: GlobalColors.mainColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(width: 10),
                    ],
                  ),
                )),
            Container(
              alignment: Alignment.centerRight,
              child: Text(S.of(context).forget_password,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: GlobalColors.secondaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      )),
    );
  }
}
