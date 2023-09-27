import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/State_holders/otp_verify_controller.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/auth/profile_complete_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../utils/app_colors.dart';
import '../../utils/image_assets.dart';

class OTPVerifyScreen extends StatefulWidget {
  const OTPVerifyScreen({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {

  TextEditingController otpEditingController = TextEditingController();
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
                  const SizedBox(height: 120,),
                  Center(child: SvgPicture.asset(ImageAssets.splashLogo,width: 100,)),
                  const SizedBox(height: 20,),
                  Text("Enter OTP Code",style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 25,)
                  ),
                  const SizedBox(height: 10,),
                  Text("A 4 digit otp code has been sent",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 16,
                          color: Colors.grey
                      )),
                  const SizedBox(height: 20,),

                  PinCodeTextField(
                    controller: otpEditingController,
                    validator:(value){
                      if(value == null || value.isEmpty){
                        return "Please Enter Your Otp Code";
                      }
                      return null;
                      },
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 45,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      activeColor: AppColors.primaryColor,
                      inactiveColor: AppColors.primaryColor,
                      selectedColor: Colors.green,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (v) {},
                    onChanged: (value) {},
                    beforeTextPaste: (text) {
                      return true;
                    },
                    appContext: context,
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: GetBuilder<OTPVerifyController>(
                      builder: (otpVerifyController) {
                        return Visibility(
                          visible: !otpVerifyController.otpVerifyInProgress,
                          replacement: const Center(child: CircularProgressIndicator(),),
                          child: ElevatedButton(
                              onPressed: (){

                                if (_formKey.currentState!.validate()){
                                  otpVerifyController.otpVerify(widget.email, otpEditingController.text).then((result){
                                    if(result == true){
                                      Get.to(()=> const ProfileCompleteScreen());
                                    }else{
                                      Get.snackbar(
                                          "failed", "Email verify failed!.try again",
                                          backgroundColor: Colors.red,
                                          colorText: Colors.white
                                      );
                                    }
                                  });
                                }

                              }, child: const Text(
                              "Next"
                          )),
                        );
                      }
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: 'This code will expire in',
                      style: TextStyle(color: Colors.grey),
                      children:[
                        TextSpan(text:' 120s',style: TextStyle(
                            color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        )),
                      ],
                    ),
                  ),
                  TextButton(
                      onPressed: (){
                      }, child:const Text("Resent Code",style: TextStyle(
                    color: AppColors.primaryColor,
                  ),)
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

