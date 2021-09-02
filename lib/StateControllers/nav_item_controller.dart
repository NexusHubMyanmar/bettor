import 'package:get/state_manager.dart';

class NavItemController extends GetxController {
  RxInt curIndex = 0.obs;

  void setIndex(index) {
    curIndex.value = index;
    update();
  }
}
