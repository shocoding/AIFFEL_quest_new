import 'package:get/get.dart';
import 'package:pomodoroapp/src/controller/bottome_nav_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent:true);
  }
}