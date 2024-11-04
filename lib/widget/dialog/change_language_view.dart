import 'package:Emend/component/button.global.dart';
import 'package:Emend/utils/constants/color.dart';
import 'package:Emend/utils/constants/constants.dart';
import 'package:Emend/utils/constants/t_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../db_helper/app_storage.dart';

class ChangeLanguageView extends StatefulWidget {
  ChangeLanguageView({super.key,required this.confirm});
  Function(String) confirm;
  AppStorageShared appStorage = AppStorageShared();
  String current_language = "";
  String language = "";

  @override
  State<ChangeLanguageView> createState() => _ChangeLanguageViewState();


}



class _ChangeLanguageViewState extends State<ChangeLanguageView> {

  @override
  void initState() {
    // TODO: implement initState
    widget.appStorage.readKey(TConstants.language).then((value){
      setState(() {
        widget.current_language = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: TColor.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 5,),
            Icon(Icons.language_outlined,color: TColor.primary,size: TSize.iconLg,),
            SizedBox(height: 5,),
            Text(AppLocalizations.of(context)!.please_choose_your_language),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonGlobal(
                  color: widget.current_language == TConstants.language_ar ? TColor.primary : TColor.textSecondary,
                  text: AppLocalizations.of(context)!.arabic,onTap: () {
                  setState(() {
                    widget.language = TConstants.language_ar;
                    widget.appStorage.putKey(TConstants.language, widget.language);
                    widget.confirm(widget.language);
                  });
                },),
                SizedBox(width: 30,),
                ButtonGlobal(
                  color: widget.current_language == TConstants.language_en ? TColor.primary : TColor.textSecondary,
                  text: AppLocalizations.of(context)!.english,onTap: () {
                  setState(() {
                    widget.language = TConstants.language_en;
                    widget.appStorage.putKey(TConstants.language, widget.language);
                    widget.confirm(widget.language);

                  });
                },),
              ],
            ),
            SizedBox(height: 5,),
            // ButtonGlobal(text: AppLocalizations.of(context)!.submit,onTap: () {
            //   widget.appStorage.readKey(TConstants.language).then((result){
            //     if(widget.language != widget.current_language){
            //       setState(() {
            //         widget.appStorage.putKey(TConstants.language, widget.language);
            //         widget.confirm();
            //       });
            //     }
            //   });
            // },)
          ],
        ),
      ),
    );
  }
}

