import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/auth/otp_verify_screen.dart';
import 'package:flutter_ecommerce/presentation/ui/utils/image_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  TextEditingController emailEditingController = TextEditingController();
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
                  Center(child: SvgPicture.asset(ImageAssets.splashLogo,width: 100,)),
                   const SizedBox(height: 20,),
                   Text("Welcome Back",style: Theme.of(context).textTheme.titleLarge?.copyWith(
                     fontSize: 25,)
                   ),
                  const SizedBox(height: 10,),
                  Text("Please Enter your Email Address",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 16,
                    color: Colors.grey
                  )),
                  const SizedBox(height: 20,),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email address';
                        //ReGex validation
                      // }else if(value.isEmpty == false){
                      //   return "Please enter valid email address";
                      }
                      return null;
                    },
                    controller: emailEditingController,
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                  ),

                  const SizedBox(height: 20,),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){
                          if (_formKey.currentState!.validate()){
                            Get.to(const OTPVerifyScreen());
                          }

                    }, child: const Text(
                    "Next"
                    )),
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
