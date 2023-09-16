import 'package:get/get.dart';
import '../State_holders/main_botom_nav_controller.dart';

class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
  }
}