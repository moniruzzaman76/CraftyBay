import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/State_holders/create_review_controller.dart';
import 'package:flutter_ecommerce/State_holders/review_list_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';


class CreateReviewScreen extends StatefulWidget {
  final int productId;

  const CreateReviewScreen({Key? key, required this.productId}) : super(key: key);

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {

  final TextEditingController reviewEditingController = TextEditingController();
  final TextEditingController ratingEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  double ratingCount = 1;

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("What is your rate?",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.blueGrey[600],
                  ),),
                  const SizedBox(height: 20,),

                RatingBar.builder(
                initialRating: 1,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemCount: 5,
                itemBuilder: (context, _) {
                  return const Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
                onRatingUpdate: (rating) {
                  ratingCount = rating;
                  if(mounted){
                    setState(() {});
                  }
                },
              ),
                  const SizedBox(height: 10,),
                  Text("Rating : ${ratingCount.toString()}",style: const TextStyle(
                    fontSize: 15,
                    letterSpacing: .5,
                  ),),
                  // SizedBox(
                  //   height: 60,
                  //   width: 200,
                  //   child: TextFormField(
                  //     readOnly: true,
                  //     controller: ratingEditingController,
                  //     decoration: InputDecoration(
                  //         hintText: "            Rating  ${ratingCount.toString()}",
                  //       border: const OutlineInputBorder(borderSide: BorderSide.none)
                  //     ),
                  //
                  //   ),
                  // ),
                  const SizedBox(height: 20,),
                  Text(
                    '''Please Share Your opinion
        about the product''',
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.blueGrey[600],
                  ),),
                  const SizedBox(height: 20,),
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
                                      ratingCount,

                                  ).then((result) {
                                    if(result == true){
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
                                        'failed!',
                                        'Product Review failed.Try again',
                                        backgroundColor: Colors.red,
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                    }
                                  });
                                }
                              }, child: const Text("Send Review")),
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
