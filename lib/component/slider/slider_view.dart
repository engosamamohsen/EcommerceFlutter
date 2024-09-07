import 'package:auth/utils/global.assets.dart';
import 'package:flutter/material.dart';

final List<String> imagesPath = ["${GlobalAssets.imagesAssetsPath}img_login.png",
"${GlobalAssets.imagesAssetsPath}img_forgot_password.png",
"${GlobalAssets.imagesAssetsPath}img_register.png"];

late List<Widget> _pages;

class SliderView extends StatelessWidget {
  const SliderView({super.key});
  
  @override
  Widget build(BuildContext context) {
        _pages = List.generate(imagesPath.length, (index) => ImagePlaceHolder( imagePath: imagesPath[index]));

    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 4,
      child: PageView.builder(
        itemCount: imagesPath.length,
        itemBuilder: (context,index){
          return _pages[index];
        }),
    );
  }
}

class ImagePlaceHolder extends StatelessWidget {
  final String? imagePath;
  const ImagePlaceHolder({super.key,this.imagePath});

  @override
  Widget build(BuildContext context) {
    print("imagePath:"+imagePath!);
    return Image.asset(imagePath!, fit: BoxFit.cover );
  }
}