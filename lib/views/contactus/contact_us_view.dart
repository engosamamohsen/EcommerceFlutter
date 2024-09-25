import 'package:auth/component/app_bar/app.bar.global.dart';
import 'package:auth/component/button.global.dart';
import 'package:auth/component/network/loading_view_full.dart';
import 'package:auth/component/network/network_error_view.dart';
import 'package:auth/component/text.form.global.dart';
import 'package:auth/component/text/text_global.dart';
import 'package:auth/core/app_color.dart';
import 'package:auth/cubit/settings/settings_cubit.dart';
import 'package:auth/cubit/settings/settings_state.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/models/address/governates_response.dart';
import 'package:auth/models/response/base_response.dart';
import 'package:auth/utils/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsView();
}

class _ContactUsView extends State<ContactUsView> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController message = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsStates>(
      listener: (context, state) {
        if (state is SettingsSuccessState<BaseResponse>) {
          print("addedd success");
          ToastMessageHelper.showToastMessage(state.data!.message);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: GlobalColors.backGroundColor,
            appBar: GlobalAppBar(
              title: S.of(context).contact_us,
            ),
            body: state is SettingsLoadingState
                ? const LoadingViewFull()
                : state is SettingsSuccessState<GovernoratesResponse> ||
                        state is SettingsLoadingButtonState ||
                        state is SettingsInitState
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SingleChildScrollView(
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                TextGlobal(
                                  text: S.of(context).contact_us_msg,
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextGlobal(
                                  text: S.of(context).we_will_help_you,
                                  fontSize: 14,
                                  textAlign: TextAlign.start,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormGlobal(
                                    hint: S.of(context).name,
                                    textInputType: TextInputType.text,
                                    obscureText: false,
                                    controller: name),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormGlobal(
                                    hint: S.of(context).phone,
                                    textInputType: TextInputType.phone,
                                    obscureText: false,
                                    controller: phone),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormGlobal(
                                    hint: S.of(context).email,
                                    textInputType: TextInputType.emailAddress,
                                    obscureText: false,
                                    controller: email),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormGlobal(
                                    hint: S.of(context).message,
                                    minLines: 6,
                                    textInputType: TextInputType.number,
                                    obscureText: false,
                                    controller: message),
                                SizedBox(
                                  height: 10,
                                ),
                                ButtonGlobal(
                                  showProgress:
                                      state is SettingsLoadingButtonState
                                          ? true
                                          : false,
                                  text: S.of(context).submit,
                                  onTap: () {
                                    if (formKey.currentState?.validate() ??
                                        false) {
                                      // if (selectedCityId == 0) {
                                      //   ToastMessageHelper.showErrorMessage(
                                      //       "${S.of(context).please_enter} ${S.of(context).city}");
                                      // }
                                      // Form is valid, proceed with sign in
                                      //call api
                                      BlocProvider.of<SettingsCubit>(context)
                                          .contactUs(name.text, phone.text,
                                              email.text, message.text);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : state is SettingsFailedState
                        ? NetworkError()
                        : Center(
                            child: TextGlobal(
                                text: S.of(context).loading_please_wait),
                          ));
      },
    );
  }
}
