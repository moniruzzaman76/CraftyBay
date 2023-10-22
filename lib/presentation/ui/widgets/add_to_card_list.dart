import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/State_holders/card_list_controller.dart';
import 'package:flutter_ecommerce/State_holders/product_delet_controller.dart';
import 'package:get/get.dart';
import '../../../data/model/card_list_model.dart';
import '../utils/app_colors.dart';
import 'custom_stepper.dart';

class ProductAddToCard extends StatelessWidget {
  final CartAndWishData cardData;
  const ProductAddToCard({
    super.key, required this.cardData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 126,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.network(cardData.product?.image ?? "",
                    errorBuilder:(context, object, stackTrace){
                      return Image.network("https://w7.pngwing.com/pngs/820/94/png-transparent-shoe-nike-air-max-sneakers-running-running-shoes-orange-outdoor-shoe-converse-thumbnail.png");
                    },
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ListTile(
                    title:  Row(
                      children: [
                        Text(cardData.product?.title ?? "New Year Special Shoe",maxLines: 1,style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          overflow: TextOverflow.ellipsis,
                        ),),
                        const Spacer(),
                        IconButton(
                            onPressed: (){
                              Get.find<ProductDeleteController>().deleteAddToCardProduct(cardData.productId.toString());
                              Get.find<CardListController>().getCardList();
                            },
                            icon: const Icon(
                              Icons.delete_forever_rounded,
                              color: Colors.red,
                              size: 23,
                            )
                        ),

                      ],
                    ),
                    subtitle:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Color : ${cardData.color ?? ""}, Size : ${cardData.size ?? " "}",style: const TextStyle(
                          fontSize: 14,
                          letterSpacing: .5,
                        ),),
                        const SizedBox(height: 12,),
                        Row(
                          children: [
                             Text("\$${cardData.product?.price ?? 1500}",style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor,
                            ),),
                            const Spacer(),
                            SizedBox(
                              height: 30,
                              child: FittedBox(
                                child: CustomStepper(
                                    lowerLimit: 1,
                                    upperLimit: 10,
                                    stepValue: 1,
                                    value: cardData.numberOfItems,
                                    onChange: (int newValue) {
                                     Get.find<CardListController>().changeItem(cardData.id!, newValue);
                                    }),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}