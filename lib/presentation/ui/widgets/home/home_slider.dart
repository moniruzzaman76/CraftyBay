import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../data/model/slider_model_data.dart';
import '../../utils/app_colors.dart';

class HomeSlider extends StatefulWidget {
  final List<SliderData> slidersData;
  const HomeSlider({super.key, required this.slidersData});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (int page, _) {
                _selectedSlider.value = page;
              }),
          items: widget.slidersData.map((slidersData) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(color: Colors.amber),
                    alignment: Alignment.center,
                    child:Image.network(
                     slidersData.image ?? "",
                        height: double.infinity,width:double.infinity,fit: BoxFit.cover,
                    ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 8,
        ),
        ValueListenableBuilder(
          valueListenable: _selectedSlider,
          builder: (context, value, _) {
            List<Widget> list = [];
            for (int i = 0; i < widget.slidersData.length; i++) {
              list.add(Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: value == i ? AppColors.primaryColor : null),
              ));
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: list,
            );
          },
        )
      ],
    );
  }
}