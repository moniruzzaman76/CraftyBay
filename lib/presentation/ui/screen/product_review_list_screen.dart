import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/create_review_screen.dart';
import 'package:get/get.dart';
import '../../../State_holders/review_list_controller.dart';
import '../utils/app_colors.dart';

class ProductReviewListScreen extends StatefulWidget {
  final int productId;
  const ProductReviewListScreen({Key? key, required this.productId}) : super(key: key);
  @override
  State<ProductReviewListScreen> createState() => _ProductReviewListScreenState();
}

class _ProductReviewListScreenState extends State<ProductReviewListScreen> {


  @override
  void initState() {
    super.initState();
    Get.find<ProductReviewController>().getProductReview(widget.productId);
  }


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
      body: GetBuilder<ProductReviewController>(
        builder: (productReviewController) {
          if(productReviewController.reviewListInProgress){
            return const Center(child: CircularProgressIndicator(),);
          }

          else if(productReviewController.reviewListModel.data!.isEmpty){
              return const Center(
                child: Text("Empty Review List.Please Create Review"),
              );
          }

          var reviewData = productReviewController.reviewListModel.data!;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: productReviewController.reviewListModel.data?.length ?? 0,
                    itemBuilder: (context, int index){
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: ListTile(
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey[200],
                                    radius: 16,
                                    child: const Icon(Icons.person_outline_outlined,color: Colors.grey,),
                                  ),
                                  const SizedBox(width: 12,),
                                   Text(reviewData[index].profile?.cusName ?? "Unknown",style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),),
                                ],
                              ),
                              subtitle: Text(reviewData[index].description ?? "",style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                letterSpacing: .2,
                              ),),
                              trailing: SizedBox(
                                width: 45,
                                child: Row(
                                  children: [
                                    Text(reviewData[index].rating ?? "0"),
                                    const Icon(Icons.star,color: Colors.amber,),
                                  ],
                                ),
                              ),
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
                       Text("Total Reviews : (${productReviewController.reviewListModel.data?.length ?? 0})",style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      )),
                      const Spacer(),
                     FloatingActionButton(
                       mini: true,
                       backgroundColor: AppColors.primaryColor,
                         onPressed: (){
                         Get.to(()=>CreateReviewScreen(
                           productId: widget.productId,
                         ));
                         },
                       child: const Icon(Icons.add),
                     ),
                      const SizedBox(width: 10,),
                    ],
                  ),
                )
              )
            ],
          );
        }
      ),
    );
  }
}
