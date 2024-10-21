import 'package:Emend/utils/constants/color.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/utils/constants/t_size.dart';
import 'package:flutter/material.dart';

class TextFormGlobal extends StatefulWidget {
  TextFormGlobal(
      {super.key,
        required this.hint,
        required this.textInputType,
        required this.obscureText,
        required this.controller,
        this.minLines = 1,
        this.validator,
        this.allowValidate = true,
        this.suffixIcon,
        this.prefixIcon});

  int minLines;
  final String hint;
  final TextInputType textInputType;
  final bool obscureText;
  final TextEditingController controller;
  String? Function(String?)? validator;
  final bool allowValidate; // Add this field

  final IconButton? suffixIcon;
  final Icon? prefixIcon;
  String? errorMsg;

  @override
  State<TextFormGlobal> createState() => _TextFormGlobalState();
}

class _TextFormGlobalState extends State<TextFormGlobal> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        widget.errorMsg = _defaultValidator(context, widget.controller.text);
      });
    });
  }

  String? _defaultValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      // ToastMessageHelper.showToastMessage(
      //     '${widget.hint} ${S.of(context).is_required}');
      return '${widget.hint} ${S.of(context).is_required}';
    }
    if (widget.textInputType == TextInputType.emailAddress) {
      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
        // ToastMessageHelper.showToastMessage(
        //     S.of(context).please_enter_valid_email);
        return S.of(context).please_enter_valid_email;
      }
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    print("msg Controller ===> ${widget.errorMsg}");
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(TSize.borderRadiusXXL),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 7),
          ]),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        keyboardType: widget.textInputType,
        validator: (String? value) {
          if (widget.allowValidate && widget.errorMsg == null && widget.controller.text.isEmpty) {
            return "${widget.hint} ${S.of(context).is_required}";
          } else {
            return null;
          }
        },
        minLines: widget.obscureText ? null : widget.minLines,
        // maxLines: null,
        // validator: validator ?? (value) => _defaultValidator(context, value),
        decoration: InputDecoration(

          contentPadding: EdgeInsets.symmetric(vertical: TSize.paddingText, horizontal: TSize.paddingText),
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(TSize.borderRadiusXXL),
            //   // borderSide: BorderSide(
            //   //   color: TColor.white
            //   // )
            // ),
            isDense: true,
            hintText: widget.hint,
            hintStyle: TextStyle(color: TColor.darkGrey),

            errorText: widget.errorMsg?.isEmpty == true ||
                widget.controller.text.isNotEmpty || !widget.allowValidate
                ? null
                : widget.errorMsg, // Show dynamic error message
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TSize.borderRadiusXXL),
              borderSide: BorderSide(
                  color: Colors.grey.shade300), // Normal border color
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TSize.borderRadiusXXL),
              borderSide: BorderSide(
                  color: TColor.error), // Normal border color
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TSize.borderRadiusXXL),
              borderSide: BorderSide(
                  color: TColor.error), // Normal border color
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TSize.borderRadiusXXL),
              borderSide: BorderSide(
                  color: TColor.primary), // Focused border color
            ),
            labelStyle: const TextStyle(
                color: Color.fromARGB(255, 190, 183, 183), height: 1),
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon),
      ),
    );
  }
}