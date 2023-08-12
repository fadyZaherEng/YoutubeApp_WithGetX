import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:youtube_app/shared/components/youtube_add_video_bottom_sheet.dart';

enum RouteName { Home, CubitVd, Add, DesignPatternsVid, Flutter }

class AppController extends GetxController{
  static AppController get to=>Get.find();

  RxInt currentIndex=0.obs;

  void changePageIndex(int index) {
    if (RouteName.values[index] == RouteName.Add) {
      Get.bottomSheet(YoutubeBottomSheet());
    } else {
      currentIndex(index);
      //equal
      //currentIndex.value=index;
    }
  }

}