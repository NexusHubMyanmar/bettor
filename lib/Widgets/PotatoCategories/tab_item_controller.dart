import 'package:get/get.dart';

class TabItemController extends GetxController {
  RxInt curIndex = 0.obs;

  void setIndex(index) {
    curIndex.value = index;
  }
}
