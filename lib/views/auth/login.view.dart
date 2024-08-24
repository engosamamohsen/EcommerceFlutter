import 'package:auth/component/app.bar.global.dart';
import 'package:auth/component/button.global.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/models/loginModel.dart';
import 'package:auth/network/api_service.dart';
import 'package:auth/network/end_point.dart';
import 'package:auth/utils/global.assets.dart';
import 'package:auth/utils/global.colors.dart';
import 'package:auth/component/text.form.global.dart';
import 'package:auth/views/auth/forget.password.view.dart';
import 'package:auth/views/auth/register.view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
            const SizedBox(
              height: 30,
            ),
            ButtonGlobal(
              text: S.of(context).sign_in,
              onTap: () {
                if (formKey.currentState?.validate() ?? false) {
                    // Form is valid, proceed with sign in
                    loginApi();
                  } 

                // Navigator.push(context,
                //     MaterialPageRoute(builder: (BuildContext context) {
                //   return RegisterView();
                // }));
              },
            ),
            const SizedBox(height: 30),
            Center(
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(text: S.of(context).dont_have_account),
                  TextSpan(text: S.of(context).sign_up,style: TextStyle(color: GlobalColors.mainColor,fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()..onTap = () {
                 Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return RegisterView();
            }));   
              }),
                ])
              )
            ),
            Container(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: (){
                  Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return ForgetPasswordView();
            }));
                },
                child: Text(S.of(context).forget_password,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: GlobalColors.secondaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        )),
        
      )),
    );
  }

  void loginApi() async{
    LoginModel loginModel = LoginModel(email : emailController.text,password: passwordController.text);

      final response = await apiService.post(EndPoint.login,loginModel.toMap());
  }
}
