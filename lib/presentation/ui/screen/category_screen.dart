import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/presentation/ui/widgets/product_card.dart';

class CateGoryScreen extends StatefulWidget {
  const CateGoryScreen({Key? key}) : super(key: key);

  @override
  State<CateGoryScreen> createState() => _CateGoryScreenState();
}

class _CateGoryScreenState extends State<CateGoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            IconButton(
              onPressed: (){

            }, icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black.withOpacity(.5),
              size: 22,
            ),),
            const Text("Electronics",style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),),

          ],
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              childAspectRatio: 7/8
            ) ,
            itemBuilder: (context, index){
              return const ProductCard();
            }
        ),
      )
    );
  }
}
