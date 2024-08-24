import 'package:fluttertoast/fluttertoast.dart';

class ToastMessageHelper {

  static void showToastMessage(String message){
    Fluttertoast.showToast(msg: message,fontSize: 20);
  }
}