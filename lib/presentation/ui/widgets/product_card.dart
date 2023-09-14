import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/image_assets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
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
                    image:const DecorationImage(
                      image: AssetImage(
                        ImageAssets.productImage,
                      )
                    )
                  ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("New Special shoe",maxLines: 1,style: TextStyle(
                      overflow:TextOverflow.ellipsis,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),),
                    Row(
                      children: [
                        Text("\$100",style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),),
                        SizedBox(width: 10,),
                        Icon(Icons.star, color: Colors.amber,size: 17,),
                        Text("4.8",style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),),
                        SizedBox(width: 12,),
                        Card(
                          color: AppColors.primaryColor,
                          child: Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}