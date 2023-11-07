import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/State_holders/create_invoice_response_controller.dart';
import 'package:flutter_ecommerce/presentation/ui/screen/payment/webview_screen.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {

  bool isCompleted = false;


  @override
  void initState()  {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
       Get.find<CreateInvoiceController>().createInvoice().then((value){
       isCompleted = value;
       if(mounted){
         setState(() {});
       }
     });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //centerTitle: true,
        title: const Text("CheckOut "),
      ),
      body: GetBuilder<CreateInvoiceController>(
        builder: (createInvoiceController) {

          if(createInvoiceController.createInvoiceInProgress){
            return const Center(child: CircularProgressIndicator());
          }

          if(!isCompleted){
            return const Center(
              child: Text("Please complete your profile first"),
            );
          }


          return ListView.separated(
            itemCount: createInvoiceController.createInvoiceData.paymentMethod?.length ?? 0,
              itemBuilder: (context, index){

              var paymentData = createInvoiceController.createInvoiceData.paymentMethod![index];

              return ListTile(
                onTap: (){
                  Get.off(()=>WebViewScreen(paymentUrl: paymentData.redirectGatewayURL!));
                },
                leading: Image.network(paymentData.logo ?? ""),
                title:  Text(paymentData.name ?? ""),
                );
              },
              separatorBuilder: (context,index){
              return const Divider();
              },

          );
        }
      ) ,
    );
  }
}
