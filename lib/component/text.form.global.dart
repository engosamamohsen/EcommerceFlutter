import 'package:auth/core/app_color.dart';
import 'package:auth/utils/toast_message.dart';
import 'package:auth/generated/l10n.dart';
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
      this.validateOnChange = true,
      this.suffixIcon,
      this.prefixIcon});

  int minLines;
  final String hint;
  final TextInputType textInputType;
  final bool obscureText;
  final TextEditingController controller;
  String? Function(String?)? validator;
  final bool validateOnChange; // Add this field

  final Icon? suffixIcon;
  final Icon? prefixIcon;
  String errorMsg = "";

  @override
  State<TextFormGlobal> createState() => _TextFormGlobalState();
}

class _TextFormGlobalState extends State<TextFormGlobal> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}






// import 'package:auth/core/app_color.dart';
// import 'package:auth/utils/toast_message.dart';
// import 'package:auth/generated/l10n.dart';
// import 'package:flutter/material.dart';

// class TextFormGlobal extends StatefulWidget {
//   TextFormGlobal(
//       {super.key,
//       required this.hint,
//       required this.textInputType,
//       required this.obscureText,
//       required this.controller,
//       this.minLines = 1,
//       this.validator,
//       this.validateOnChange = true,
//       this.suffixIcon,
//       this.prefixIcon});

//   int minLines;
//   final String hint;
//   final TextInputType textInputType;
//   final bool obscureText;
//   final TextEditingController controller;
//   String? Function(String?)? validator;
//   final bool validateOnChange; // Add this field

//   final Icon? suffixIcon;
//   final Icon? prefixIcon;
//   String errorMsg = "";
//   @override
//   _TextFormGlobalState createState() => _TextFormGlobalState();
// }

// class _TextFormGlobalState extends State<TextFormGlobal> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     widget.controller.addListener(() {
//       setState(() {
//         ;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (widget.validateOnChange) {}
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(6),
//           boxShadow: [
//             BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 7),
//           ]),
//       child: TextFormField(
//         controller: widget.controller,
//         obscureText: widget.obscureText,
//         keyboardType: widget.textInputType,

//         minLines: widget.minLines,
//         maxLines: null,
//         // validator: validator ?? (value) => _defaultValidator(context, value),
//         decoration: InputDecoration(
//             hintText: widget.hint,
//             errorText: widget.errorMsg.isNotEmpty ? widget.errorMsg : null,
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(6),
//               borderSide: BorderSide(
//                   color: Colors.grey.shade300), // Normal border color
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(6),
//               borderSide: BorderSide(
//                   color: GlobalColors.mainColor), // Focused border color
//             ),
//             labelStyle: const TextStyle(
//                 color: Color.fromARGB(255, 190, 183, 183), height: 1),
//             suffixIcon: widget.suffixIcon,
//             prefixIcon: widget.prefixIcon),
//       ),
//     );
//   }

//   String? _defaultValidator(BuildContext context, String? value) {
//     if (value == null || value.isEmpty) {
//       ToastMessageHelper.showToastMessage(
//           '${widget.hint} ${S.of(context).is_required}');
//       return '${widget.hint} ${S.of(context).is_required}';
//     }
//     if (widget.textInputType == TextInputType.emailAddress) {
//       if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//         ToastMessageHelper.showToastMessage(
//             S.of(context).please_enter_valid_email);
//         return S.of(context).please_enter_valid_email;
//       }
//     }
//     return "";
//   }
// }

