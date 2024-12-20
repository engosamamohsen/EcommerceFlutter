import 'package:Emend/component/app_bar/app.bar.global.dart';
import 'package:Emend/component/button.global.dart';
import 'package:Emend/component/network/loading_view_full.dart';
import 'package:Emend/component/network/network_error_view.dart';
import 'package:Emend/component/text.form.global.dart';
import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/utils/constants/color.dart';
import 'package:Emend/cubit/settings/settings_cubit.dart';
import 'package:Emend/cubit/settings/settings_state.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/models/address/governates_response.dart';
import 'package:Emend/models/response/base_response.dart';
import 'package:Emend/utils/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            backgroundColor: TColor.backGroundColor,
            appBar: GlobalAppBar(
              title: AppLocalizations.of(context)!.contact_us,
            ),
            body: state is SettingsLoadingState
                ? const LoadingViewFull()
                : Padding(
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
                              text: AppLocalizations.of(context)!.contact_us_msg,
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextGlobal(
                              text: AppLocalizations.of(context)!.we_will_help_you,
                              fontSize: 14,
                              textAlign: TextAlign.start,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormGlobal(
                                hint: AppLocalizations.of(context)!.name,
                                textInputType: TextInputType.text,
                                obscureText: false,
                                controller: name),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormGlobal(
                                hint: AppLocalizations.of(context)!.phone,
                                textInputType: TextInputType.phone,
                                obscureText: false,
                                controller: phone),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormGlobal(
                                hint: AppLocalizations.of(context)!.email,
                                textInputType: TextInputType.emailAddress,
                                obscureText: false,
                                controller: email),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormGlobal(
                                hint: AppLocalizations.of(context)!.message,
                                maxLines: 6,
                                textInputType: TextInputType.text,
                                obscureText: false,
                                controller: message),
                            SizedBox(
                              height: 10,
                            ),
                            ButtonGlobal(
                              showProgress: state is SettingsLoadingButtonState
                                  ? true
                                  : false,
                              text: AppLocalizations.of(context)!.submit,
                              onTap: () {
                                if (formKey.currentState?.validate() ?? false) {
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
                  ));
      },
    );
  }
}
