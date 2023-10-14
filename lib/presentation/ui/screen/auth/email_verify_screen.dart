import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/State_holders/email_verification_controller.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


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
                  const SizedBox(height: 60,),
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
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Enter your email address";
                      }else if(value.isEmail == false){
                        return "Enter your Valid email";
                      }
                      return null;
                      },
                    controller: emailEditingController,
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                  ),

                  const SizedBox(height: 20,),

                  GetBuilder<EmailVerifyController>(
                    builder: (emailVerifyController) {
                      return Visibility(
                        visible: !emailVerifyController.emailVerifyInProgress,
                        replacement: const Center(child: CircularProgressIndicator(),),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: (){
                                if (_formKey.currentState!.validate()){
                                  emailVerifyController.emailVerify(emailEditingController.text.trim()).then((result){
                                    if(result == true){
                                      Get.to(()=> OTPVerifyScreen(email: emailEditingController.text.trim(),));
                                    }else{
                                      Get.snackbar(
                                          "failed", "Email verify failed!.try again",
                                          backgroundColor: Colors.red,
                                          colorText: Colors.white
                                      );
                                    }
                                  });
                                }

                          }, child: const Text("Next")),
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

  // Future<void> verifyEmail(EmailVerifyController emailVerifyController) async {
  //   final response =
  //   await emailVerifyController.emailVerify(emailEditingController.text.trim());
  //   if (response) {
  //     Get.to(const OTPVerifyScreen());
  //   } else {
  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text('Email verification failed! Try again'),
  //         ),
  //       );
  //     }
  //   }

  }

