import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/presentation/ui/utils/app_colors.dart';
import 'package:flutter_ecommerce/presentation/ui/utils/image_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/circular_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title:SvgPicture.asset(ImageAssets.homeLogo),
        actions: [
           CircularIconButton(
             onPress: (){},
             icon: Icons.person_outline_outlined,
           ),
          const SizedBox(width: 10,),
          CircularIconButton(
            onPress: (){},
            icon: Icons.phone_outlined,
          ),
          const SizedBox(width: 10,),
          CircularIconButton(
            onPress: (){

            },
            icon: Icons.notifications_outlined,
          ),
          const SizedBox(width: 10,),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "search",
                  fillColor: Colors.grey[200],
                  filled: true,
                  prefixIcon: const Icon(Icons.search,color: Colors.grey,),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none
                  ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none
                    ),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none
                  ),
                ),
              ),
              const SizedBox(height: 16,),

              CarouselSlider(
                options: CarouselOptions(
                    height: 200.0,
                  autoPlay: true,
                ),
                items: [1,2,3,4,5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration:const BoxDecoration(
                              color: AppColors.primaryColor
                          ),
                          child: Center(child: Text('text $i',))
                      );
                    },
                  );
                }).toList(),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


