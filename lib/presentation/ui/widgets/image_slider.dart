import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../utils/image_assets.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    super.key,
    required this.selectedSlider, this.height,
  });

  final ValueNotifier selectedSlider;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height ?? 240,
        viewportFraction: 1,
        autoPlay: true,
        onPageChanged: ( int page, _ ){
          selectedSlider.value = page;
        },

      ),
      items: [1,2,3,4,5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.2)
                ),
                child: Center(
                  child: Image.asset(ImageAssets.productImage,fit: BoxFit.cover,),
                )
            );
          },
        );
      }).toList(),
    );
  }
}