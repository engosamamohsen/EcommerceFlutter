import 'package:auth/component/app.bar.global.dart';
import 'package:auth/component/button.global.dart';
import 'package:auth/component/text.form.global.dart';
import 'package:auth/utils/global.assets.dart';
import 'package:auth/views/confirm.code.view.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(),
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
                "${GlobalAssets.imagesAssetsPath}img_register.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            const Text("Please Make A new Account",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 18)),
            const SizedBox(height: 10),
            TextFormGlobal(
                hint: "Username",
                textInputType: TextInputType.name,
                obscureText: false,
                controller: nameController),
            const SizedBox(height: 10),
            TextFormGlobal(
                hint: "Email Address",
                textInputType: TextInputType.emailAddress,
                obscureText: false,
                controller: emailController),
            const SizedBox(height: 10),
            TextFormGlobal(
                hint: "Password",
                textInputType: TextInputType.visiblePassword,
                obscureText: true,
                controller: passwordController),
            const SizedBox(height: 10),
            TextFormGlobal(
                hint: "Confirm Password",
                textInputType: TextInputType.visiblePassword,
                obscureText: true,
                controller: confirmPasswordController),
            const SizedBox(height: 10),
            const SizedBox(
              height: 30,
            ),
            ButtonGlobal(
              text: "Register",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const ConfirmCodeView();
                }));
              },
            ),
          ],
        ),
      )),
    );
  }
}
