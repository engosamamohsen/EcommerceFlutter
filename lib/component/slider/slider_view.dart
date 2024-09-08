import 'package:auth/component/image/image_round.dart';
import 'package:auth/models/home/home_response.dart';
import 'package:auth/utils/global.assets.dart';
import 'package:flutter/material.dart';

final List<String> imagesPath = [
  "${GlobalAssets.imagesAssetsPath}img_login.png",
  "${GlobalAssets.imagesAssetsPath}img_forgot_password.png",
  "${GlobalAssets.imagesAssetsPath}img_register.png"
];

late List<Widget> _pages;

class SliderView extends StatelessWidget {
  SliderView({super.key, required this.slider});
  final List<Banners> slider;

  @override
  Widget build(BuildContext context) {
    _pages = List.generate(slider.length,
        (index) => ImageRound(image: slider[index].banner, round: 50.0));

    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 4,
      child: PageView.builder(
          itemCount: slider.length,
          itemBuilder: (context, index) {
            return _pages[index];
          }),
    );
  }
}

class ImagePlaceHolder extends StatelessWidget {
  final String? imagePath;
  const ImagePlaceHolder({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    print("imagePath:" + imagePath!);
    return Image.asset(imagePath!, fit: BoxFit.cover);
  }
}