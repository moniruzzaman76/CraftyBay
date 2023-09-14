import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

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
        title: Row(
          children: [
            IconButton(
              onPressed: (){

              }, icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black.withOpacity(.5),
              size: 22,
            ),),
            const Text("Reviews",style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),),

          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
          itemBuilder: (context, int index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
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

    );
  }
}
