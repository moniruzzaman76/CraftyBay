import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/create_review_screen.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class ReviewScreen extends StatefulWidget {
  final int productId;
  const ReviewScreen({Key? key, required this.productId}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text("Reviews",style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),),
        leading:  IconButton(
          onPressed: (){
            Get.back();
          }, icon: Icon(
          Icons.arrow_back_outlined,
          color: Colors.black.withOpacity(.5),
          size: 22,
        ),),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
                itemBuilder: (context, int index){
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        child: ListTile(
                          title: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey[200],
                                radius: 16,
                                child: const Icon(Icons.person_outline_outlined,color: Colors.grey,),
                              ),
                              const SizedBox(width: 12,),
                              const Text("Moniruzzaman",style: TextStyle(
                                color: Colors.black54,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),)
                            ],
                          ),
                          subtitle: const Text('''A positive review expresses overall satisfaction with a product, service, or experience, highlighting specific aspects the reviewer enjoyed or found beneficial. ''',style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            letterSpacing: .2,
                          ),),
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.2),
              borderRadius: const BorderRadius.only(
                topLeft:Radius.circular(16),
                topRight:Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(width: 10,),
                  const Text("Reviews : (1000)",style: TextStyle(
                    fontSize: 18,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  )),
                  const Spacer(),
                 FloatingActionButton(
                   mini: true,
                   backgroundColor: AppColors.primaryColor,
                     onPressed: (){
                     Get.to( CreateReviewScreen(productId: widget.productId.toString(),));
                     },
                   child: const Icon(Icons.add),
                 ),
                  const SizedBox(width: 10,),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
