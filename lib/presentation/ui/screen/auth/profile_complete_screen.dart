import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/State_holders/complete_profile_controller.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/botom_nav_bar_screen.dart';
import 'package:flutter_ecommerce/presentation/ui/utils/image_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ProfileCompleteScreen extends StatefulWidget {
  const ProfileCompleteScreen({Key? key}) : super(key: key);

  @override
  State<ProfileCompleteScreen> createState() => _ProfileCompleteScreenState();
}

class _ProfileCompleteScreenState extends State<ProfileCompleteScreen> {

  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController mobileEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController cityEditingController = TextEditingController();
  TextEditingController shippingAddressEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 18,),
                  Center(child: SvgPicture.asset(ImageAssets.splashLogo,width: 100,)),
                   const SizedBox(height: 20,),
                   Text("Complete Profile",style: Theme.of(context).textTheme.titleLarge?.copyWith(
                     fontSize: 25,)
                   ),
                  const SizedBox(height: 7,),
                  Text("Get started with us with your details",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 15,
                    color: Colors.grey
                  )),
                  const SizedBox(height: 20,),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your First First';
                      }
                      return null;
                    },
                    controller: firstNameEditingController,
                    decoration: const InputDecoration(
                      hintText: "First Name",
                    ),
                  ),
                  const SizedBox(height: 16,),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your Last Name';
                      }
                      return null;
                    },
                    controller: lastNameEditingController,
                    decoration: const InputDecoration(
                      hintText: "Last Name",
                    ),
                  ),
                  const SizedBox(height: 16,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your Mobile Number';
                      }
                      return null;
                    },
                    controller: mobileEditingController,
                    decoration: const InputDecoration(
                      hintText: "Mobile Number",
                    ),
                  ),

                  const SizedBox(height: 16,),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your city';
                      }
                      return null;
                    },
                    controller: cityEditingController,
                    decoration: const InputDecoration(
                      hintText: "City",
                    ),
                  ),

                  const SizedBox(height: 16,),
                  TextFormField(
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your Shipping Address';
                      }
                      return null;
                    },
                    controller: shippingAddressEditingController,
                    decoration: const InputDecoration(
                      hintText: "Shipping Address",
                    ),
                  ),

                  const SizedBox(height: 16,),

                  GetBuilder<CompleteProfileController>(
                    builder: (completeProfileController) {
                      return Visibility(
                        visible: !completeProfileController.createProfileInProgress,
                        replacement: const Center(child: CircularProgressIndicator(),),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: (){
                                if (_formKey.currentState!.validate()){
                                  completeProfileController.createProfile(

                                      firstNameEditingController.text.trim(),
                                      lastNameEditingController.text.trim(),
                                      mobileEditingController.text.trim(),
                                      cityEditingController.text.trim(),
                                      shippingAddressEditingController.text.trim()).then((result){
                                        if(result == true){
                                          Get.to(()=> const BottomNavBarScreen());
                                          firstNameEditingController.clear();
                                          lastNameEditingController.clear();
                                          mobileEditingController.clear();
                                          cityEditingController.clear();
                                          shippingAddressEditingController.clear();

                                          Get.snackbar(
                                              "Success!", "Profile Completed has been done",
                                              backgroundColor: Colors.green,
                                              colorText: Colors.white
                                          );
                                        }else{
                                          Get.snackbar(
                                              "Failed!", "Please try again",
                                              backgroundColor: Colors.red,
                                              colorText: Colors.white
                                          );
                                        }
                                  });

                                }
                          }, child: const Text(
                          "Complete"
                          )),
                        ),
                      );
                    }
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
