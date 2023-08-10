import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_app/controllers/search_controller.dart';
import 'package:youtube_app/controllers/youtube_details_controller.dart';
import 'package:youtube_app/layout/controller/app_controller.dart';
import 'package:youtube_app/repo/repository.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(YoutuberRepository(), permanent: true);
    Get.put(AppController(),permanent: true);
    Get.lazyPut<YoutubeDetailsController>(() => YoutubeDetailsController(),fenix: true);
    Get.lazyPut<SearchYoutubeController>(() => SearchYoutubeController(),fenix: true);

  }
}