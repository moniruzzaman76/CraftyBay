import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/State_holders/create_review_controller.dart';
import 'package:flutter_ecommerce/State_holders/review_list_controller.dart';
import 'package:get/get.dart';


class CreateReviewScreen extends StatefulWidget {
  final int productId;
  const CreateReviewScreen({Key? key, required this.productId}) : super(key: key);

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  TextEditingController firstNameEditingController = TextEditingController();

  TextEditingController lastNameEditingController = TextEditingController();

  TextEditingController reviewEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text("Create Reviews",style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),),
        leading: const BackButton(
          color: Colors.black54,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    maxLines: 10,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your Review';
                      }
                      return null;
                    },
                    controller: reviewEditingController,
                    decoration: const InputDecoration(
                      hintText: "Write Review",
                    ),
                  ),

                  const SizedBox(height: 16,),

                  GetBuilder<CreateReviewController>(
                    builder: (createReviewController) {
                      return Visibility(
                        visible: !createReviewController.createReviewInProgress,
                        replacement: const Center(child: CircularProgressIndicator(),),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: (){
                                if (_formKey.currentState!.validate()){
                                  createReviewController.createReview(
                                    reviewEditingController.text.trim(),
                                      widget.productId,
                                  ).then((result) {
                                    if(result == true){
                                      firstNameEditingController.clear();
                                    lastNameEditingController.clear();
                                    reviewEditingController.clear();

                                    Get.find<ProductReviewController>().getProductReview(widget.productId);

                                      Get.snackbar(
                                        'Thank you for your feedback!',
                                        'Successfully added review',
                                        backgroundColor: Colors.green.withOpacity(.5),
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                    }else{
                                      Get.snackbar(
                                        'Thank you for your feedback!',
                                        'Successfully added review',
                                        backgroundColor: Colors.red,
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                    }
                                  });
                                }
                              }, child: const Text("Submit")),
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
