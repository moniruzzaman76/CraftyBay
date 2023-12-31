import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/State_holders/create_wishList_controller.dart';
import 'package:get/get.dart';
import '../../../data/model/product_remark_model_data.dart';
import '../screen/product_details_screen.dart';
import '../utils/app_colors.dart';

class ProductCard extends StatelessWidget {
  final RemarkData remarkData;
  const ProductCard({
    super.key, required this.remarkData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=> ProductDetailsScreen(productId: remarkData.id!,));
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: FittedBox(
          child: SizedBox(
           width: 125,
            child: Column(
              children: [
                Container(
                  height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(.1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(remarkData.image ?? ""),
                      )
                    ),
                ),
                 FittedBox(
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(remarkData.title ?? "",maxLines: 1,style: const TextStyle(
                           overflow:TextOverflow.ellipsis,
                           fontSize: 12,
                           fontWeight: FontWeight.w500,
                         ),),
                          Row(
                           children: [
                             Text("\$${remarkData.price}",style: const TextStyle(
                               fontSize: 12,
                               fontWeight: FontWeight.w500,
                               color: AppColors.primaryColor,
                             ),),
                             const SizedBox(width: 10,),
                             const Icon(Icons.star, color: Colors.amber,size: 17,),
                              Text(remarkData.star!.toStringAsFixed(1),style: const TextStyle(
                               fontSize: 12,
                               fontWeight: FontWeight.w500,
                             ),),
                             const SizedBox(width: 12,),
                             InkWell(
                               onTap:(){
                                 Get.find<CreateWishListController>().createWishList(remarkData.id.toString()).then((result){
                                   if(result == true){
                                     Get.snackbar(
                                       "Success", "add To Wish List Screen",
                                       backgroundColor: Colors.green,
                                       colorText: Colors.white,
                                     );
                                   }else{
                                     Get.snackbar(
                                       "failed!", "Please try Again",
                                       backgroundColor: Colors.red,
                                       colorText: Colors.white,
                                     );
                                   }
                                 });
                               },
                               child: const Card(
                                 color: AppColors.primaryColor,
                                 child: Icon(
                                   Icons.favorite_border_outlined,
                                   color: Colors.white,
                                   size: 14,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ],
                     ),
                   ),
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}