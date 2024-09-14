import 'package:auth/core/app_color.dart';
import 'package:auth/utils/toast_message.dart';
import 'package:auth/generated/l10n.dart';
import 'package:flutter/material.dart';

class TextFormGlobal extends StatelessWidget {
  const TextFormGlobal(
      {super.key,
      required this.hint,
      required this.textInputType,
      required this.obscureText,
      required this.controller,
      this.validator,
      this.suffixIcon,
      this.prefixIcon});

  final String hint;
  final TextInputType textInputType;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 7),
          ]),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: textInputType,
        validator: validator ?? (value) => _defaultValidator(context, value),
        decoration: InputDecoration(
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                  color: Colors.grey.shade300), // Normal border color
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                  color: GlobalColors.mainColor), // Focused border color
            ),
            labelStyle: const TextStyle(
                color: Color.fromARGB(255, 190, 183, 183), height: 1),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon),
      ),
    );
  }

  String? _defaultValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      ToastMessageHelper.showToastMessage('$hint ${S.of(context).is_required}');
      return '$hint ${S.of(context).is_required}';
    }
    if (textInputType == TextInputType.emailAddress) {
      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
        ToastMessageHelper.showToastMessage(
            S.of(context).please_enter_valid_email);
        return S.of(context).please_enter_valid_email;
      }
    }
    // if (textInputType == TextInputType.visiblePassword && obscureText) {
    //   if (value.length < 6) {
    //     return 'Password must be at least 6 characters long';
    //   }
    // }
    return null;
  }
}
