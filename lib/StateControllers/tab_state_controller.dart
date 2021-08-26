import 'package:get/state_manager.dart';

class TabState extends GetxController{
  RxInt index = 0.obs;
  void onTabTap(int index){
    this.index.value = index;
    update();
  }
}