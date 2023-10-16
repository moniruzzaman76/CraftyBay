import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/State_holders/CreateWishListController.dart';
import 'package:flutter_ecommerce/State_holders/create_add_to_card_controller.dart';
import 'package:flutter_ecommerce/State_holders/product_details_controller.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/product_review_list_screen.dart';
import 'package:flutter_ecommerce/presentation/ui/widgets/home/product_image_slider.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/color_extension.dart';
import '../widgets/app_bar_back_button.dart';
import '../widgets/custom_stepper.dart';
import '../widgets/payment_card.dart';
import '../widgets/section_title_text.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen({Key? key, required this.productId})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedColor = 0;
  int selectedSize = 0;

  double totalAmount = 0.0;
  final ValueNotifier<int> _selectedValue = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductDetailController>(
          builder: (productDetailController) {
        if (productDetailController.productDetailsInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Color> availableColors = getColorsFromString(productDetailController.productDetails.color ?? "");
        List<String> availableSizes = getSizesFromString(productDetailController.productDetails.size ?? "");

        totalAmount = double.parse(productDetailController.productDetails.product?.price.toString() ?? "");

        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Stack(
                      children: [
                        ProductImageSlider(imageList: [
                          productDetailController.productDetails.img1 ?? "",
                          productDetailController.productDetails.img2 ?? "",
                          productDetailController.productDetails.img3 ?? "",
                          productDetailController.productDetails.img4 ?? "",
                        ]),
                        const AppBarBackButton(title: 'Product details',),
                      ],
                    ),
                    const SizedBox(height: 4,),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 265,
                                child: SectionTitle(
                                  title: productDetailController.productDetails.product?.title ?? "",
                                  maxLine: 2,
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                height: 30,
                                child: FittedBox(
                                  child: CustomStepper(
                                      lowerLimit: 1,
                                      upperLimit: 10,
                                      stepValue: 1,
                                      value: 2,
                                      onChange: (newValue) {
                                        var total = _selectedValue.value = newValue; // Update the selected value
                                        totalAmount = double.parse(productDetailController.productDetails.product?.price ?? "0") *total;
                                        print(totalAmount);
                                      }),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 25,),
                              const SizedBox(width: 4,),
                              Text("${productDetailController.productDetails.product?.star ?? 0}", style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 16,),
                              TextButton(
                                onPressed: () {
                                  Get.to(() => ProductReviewListScreen(productId: productDetailController.productDetails.productId ?? 0,));
                                  },
                                child: const Text("Review", style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16,),
                              GetBuilder<CreateWishListController>(
                                  builder: (createWishListController) {
                                return InkWell(
                                  onTap: () {
                                    createWishListController.createWishList(
                                        productDetailController.productDetails.id.toString()).then((result) {
                                      if (result == true) {
                                        Get.snackbar(
                                          "Success", "add To Wish List Screen",
                                          backgroundColor: Colors.green,
                                          colorText: Colors.white,
                                        );
                                      } else {
                                        Get.snackbar(
                                          "failed!", "Please try Again",
                                          backgroundColor: Colors.red,
                                          colorText: Colors.white,
                                        );}
                                    });
                                  },
                                  child: const Card(
                                    color: AppColors.primaryColor,
                                    child: Icon(Icons.favorite_border_outlined, color: Colors.white, size: 23,),),
                                );
                              }),
                            ],
                          ),
                          const SizedBox(height: 5,),
                          const SectionTitle(title: "Color",),
                          const SizedBox(height: 16,),

                          colorPicker(availableColors),

                          const SizedBox(height: 16,),
                          const SectionTitle(title: "Size",),
                          const SizedBox(height: 16,),

                          sizePicker(availableSizes),

                          const SizedBox(height: 16,),
                          const SectionTitle(title: "Description",),
                          const SizedBox(height: 8,),
                          Text(productDetailController.productDetails.product?.shortDes ?? "",
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
              ),
              GetBuilder<CreateAddToCardController>(
                  builder: (addToCardController) {
                return PaymentCard(
                  title: "Price",
                  totalCount: "\$${totalAmount.toString()}",
                  buttonName: 'Add to cart',
                  child: Visibility(
                    visible: !addToCardController.addToCardInProgress,
                    replacement: const Center(child: CircularProgressIndicator(),),
                    child: ElevatedButton(
                    onPressed: () {
                      addToCardController.addToCard(
                        productDetailController.productDetails.id!,
                        availableColors[selectedColor].toString(),
                        availableSizes[selectedSize],
                      ).then((result) {
                        if (result == true) {
                          Get.snackbar(
                            "Success",
                            "Product Added to Card",
                            backgroundColor: Colors.green,
                          );
                        } else {
                          Get.snackbar(
                            "failed",
                            "Product Added to Card",
                            backgroundColor: Colors.red,
                          );
                        }
                      });
                    },
                    child: const Text("Add To Card"),

                ),
                  ),
                );
              }),
            ],
          ),
        );
      }),
    );
  }

  SizedBox sizePicker(List<String> availableSizes) {
    return SizedBox(
      height: 28,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: availableSizes.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              selectedSize = index;
              if (mounted) {
                setState(() {});
              }
              print(index);
              print(availableSizes[index].toString());
            },
            child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(3),
                  color: selectedSize == index
                      ? AppColors.primaryColor
                      : Colors.white,
                ),
                child: Text(
                  availableSizes[index],
                  style: TextStyle(
                    color: selectedSize == index ? Colors.white : Colors.black,
                  ),
                )),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }

  SizedBox colorPicker(List<Color> availableColors) {
    return SizedBox(
      height: 28,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: availableColors.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              selectedColor = index;
              if (mounted) {
                setState(() {});
              }
              print(selectedColor);
              print(availableColors[selectedColor].toString());
            },
            child: CircleAvatar(
              backgroundColor: availableColors[index],
              radius: 15,
              child: selectedColor == index
                  ? const Icon(Icons.check, color: Colors.white,) : null,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }

  List<Color> getColorsFromString(String colors) {
    List<Color> hexaColors = [];
    final List<String> allColors = colors.split(",");
    for (var element in allColors) {
      hexaColors.add(HexColor(element));
    }
    return hexaColors;
  }

  List<String> getSizesFromString(String sizes) {
    return sizes.split(",");
  }
}
