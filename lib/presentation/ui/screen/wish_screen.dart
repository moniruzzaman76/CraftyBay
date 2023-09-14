import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
class WishScreen extends StatefulWidget {
  const WishScreen({Key? key}) : super(key: key);

  @override
  State<WishScreen> createState() => _WishScreenState();
}

class _WishScreenState extends State<WishScreen> {


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
            const Text("Wish List",style: TextStyle(
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
                  childAspectRatio: 5/6
              ) ,
              itemBuilder: (context, index){
                return const ProductCard();
              }
          ),
        )
    );
  }
}
