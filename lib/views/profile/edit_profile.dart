import 'dart:io';

import 'package:Emend/component/app_bar/app.bar.global.dart';
import 'package:Emend/component/button.global.dart';
import 'package:Emend/component/image/image_circle.dart';
import 'package:Emend/component/image/image_circle_avatar.dart';
import 'package:Emend/component/text.form.global.dart';
import 'package:Emend/cubit/auth/auth_cubit.dart';
import 'package:Emend/cubit/auth/auth_state.dart';
import 'package:Emend/db_helper/app_storage.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/models/login/login_response.dart';
import 'package:Emend/utils/global.assets.dart';
import 'package:Emend/utils/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  UserResponse? user;
  // AppStorage appStorage = AppStorage();
  AppStorageShared appStorage = AppStorageShared();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    try {
      UserResponse fetchedUser = await appStorage.getUser();
      setState(() {
        user = fetchedUser;
        nameController.text = user!.data!.name.toString();
        phoneController.text = user!.data!.phone.toString();
        emailController.text = user!.data!.email.toString();
      });
    } catch (e) {
      // Handle error appropriately
      print('Error loading user: $e');
    }
  }

  File? _fileImage;
  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _fileImage = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          print("state: ${state.toString()}");
          if (state is AuthSuccessState<UserResponse>) {
            ToastMessageHelper.showToastMessage(state.data!.message.toString());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: GlobalAppBar(title: S.of(context).edit_profile),
            backgroundColor: Colors.white,
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      // if (_image != null) Image.file(_image!),
                      // ImageCircle(
                      //   width: 60,
                      //   height: 60,
                      //   image: user != null &&
                      //           user!.data != null &&
                      //           user!.data!.image != null
                      //       ? user!.data!.image.toString()
                      //       : "",
                      //   click: () {
                      //     getImageFromGallery();
                      //   },
                      // ),
                      ImageCircleAvatar(
                        width: 80,
                        height: 80,
                        image: user != null &&
                            user!.data != null &&
                            user!.data!.image != null
                            ? user!.data!.image.toString()
                            : "",
                        fileImage: _fileImage,
                        click: () {
                          getImageFromGallery();
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
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
                      const SizedBox(
                        height: 30,
                      ),
                      ButtonGlobal(
                        text: S.of(context).update_profile,
                        showProgress: state is AuthLoadingState ? true : false,
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            // Form is valid, proceed with sign in
                            BlocProvider.of<AuthCubit>(context).updateProfile(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                image: _fileImage);
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
              ),
            ),
          );
        },
      ),
    );
  }
}

