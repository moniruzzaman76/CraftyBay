import 'package:flutter/material.dart';


class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({Key? key}) : super(key: key);

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {

  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController reviewEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();



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
                Navigator.pop(context);
              }, icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black.withOpacity(.5),
              size: 25,
            ),),
            const Text("Create Reviews",style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your First First';
                      }
                      return null;
                    },
                    controller: firstNameEditingController,
                    decoration: const InputDecoration(
                      hintText: "First Name",
                    ),
                  ),
                  const SizedBox(height: 16,),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your Last Name';
                      }
                      return null;
                    },
                    controller: lastNameEditingController,
                    decoration: const InputDecoration(
                      hintText: "Last Name",
                    ),
                  ),
                  const SizedBox(height: 16,),
                  TextFormField(
                    maxLines: 10,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your Review';
                      }
                      return null;
                    },
                    controller: reviewEditingController,
                    decoration: const InputDecoration(
                      hintText: "Write Review",
                    ),
                  ),

                  const SizedBox(height: 16,),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){
                          if (_formKey.currentState!.validate()){

                          }
                        }, child: const Text(
                        "Submit"
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
