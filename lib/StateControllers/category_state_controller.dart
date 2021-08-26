import 'package:get/state_manager.dart';

class CategoryStateController extends GetxController{
  RxInt categoryIndex = 0.obs;
  void onCategoryChange(int index){
    this.categoryIndex.value = index;
    update();
  }
}