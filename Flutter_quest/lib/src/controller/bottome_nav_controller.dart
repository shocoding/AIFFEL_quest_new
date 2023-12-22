import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

enum PageName { HOME, REWARD, MORE }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changeBottomNav(int value) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.HOME:
        break;
      case PageName.REWARD:
        break;
      case PageName.MORE:
        break;
    }
    pageIndex(value);
  }
}
