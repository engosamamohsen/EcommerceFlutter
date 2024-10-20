import 'dart:io';

import 'package:Emend/utils/constants/t_size.dart';
import 'package:flutter/cupertino.dart';

class DeviceUtils{

  static bool isIOS(){
    return Platform.isIOS;
  }

  static bool isAndroid(){
    return Platform.isAndroid;
  }

  static bool isDesktopScreen(BuildContext context){
    return MediaQuery.of(context).size.width >= TSize.desktopScreenSize;
  }

  static bool isTabletScreen(BuildContext context){
    return MediaQuery.of(context).size.width >= TSize.tabletScreenSize && MediaQuery.of(context).size.width < TSize.desktopScreenSize;
  }

  static bool isMobileScreen(BuildContext context){
    return MediaQuery.of(context).size.width < TSize.tabletScreenSize ;
  }
}