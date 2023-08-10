import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum RouteName { Home, CubitVd, Add, DesignPatternsVid, Flutter }

class AppController extends GetxController{
  static AppController get to=>Get.find();

  RxInt currentIndex=0.obs;

  void changePageIndex(int index) {
    if (RouteName.values[index] == RouteName.Add) {
      _showBottomSheet();
    } else {
      currentIndex(index);
      //equal
      //currentIndex.value=index;
    }
  }

  void _showBottomSheet() {
    Get.bottomSheet(Text(""));
  }

}