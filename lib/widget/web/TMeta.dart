import 'package:flutter/foundation.dart';
import 'package:meta_seo/meta_seo.dart';

class TMeta{
  static void keywords(){
    if(kIsWeb) {
      MetaSEO meta = MetaSEO();
      meta.author(author: 'Eng Mohamed Khaled');
      meta.description(description: 'Emend Ecommerce');
      meta.keywords(
          keywords: 'ديكور, ابواب , دهانات , شبابيك , جبس ، جبسن بورد');
    }
  }
}