import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/card_list_model.dart';
import '../screen/product_details_screen.dart';
import '../utils/app_colors.dart';

class WishListProductCard extends StatelessWidget {
  final CartAndWishData wishData;
  final VoidCallback onPress;
  const WishListProductCard({
    super.key, required this.wishData, required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=>ProductDetailsScreen(productId: wishData.id!,));
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
                        image: NetworkImage(wishData.product?.image ?? "https://w7.pngwing.com/pngs/820/94/png-transparent-shoe-nike-air-max-sneakers-running-running-shoes-orange-outdoor-shoe-converse-thumbnail.png"),

                      )
                  ),
                ),
                FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(wishData.product?.title ?? "New Year Special Shoe",maxLines: 1,style: const TextStyle(
                          overflow:TextOverflow.ellipsis,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),),
                        Row(
                          children: [
                            Text("\$${wishData.product?.price ?? "1000"}",style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                            ),),
                            const SizedBox(width: 10,),
                            const Icon(Icons.star, color: Colors.amber,size: 17,),
                            Text(wishData.product?.star?.toStringAsFixed(1) ?? "4.5",style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),),
                            const SizedBox(width: 12,),
                            InkWell(
                              onTap:onPress,
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