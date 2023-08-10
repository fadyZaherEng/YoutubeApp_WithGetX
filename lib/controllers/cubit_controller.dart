import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:youtube_app/models/youtube_model_based_q/YoutubeResponseBasedQ.dart';
import 'package:youtube_app/repo/repository.dart';
//اليتوتيوب مش بيرجع كل الفيديو مره واحده بيديك اول مره نيكست باج توكن تستخدمه
//وانت بتعمل اسكرول وخلصت تستخدمه وتعمل كول تاني تجيب تاني منه وهكذا لحد ما يرجع كل الفيديو

class CubitController extends GetxController {
  YoutuberRepository youtuberRepository = YoutuberRepository.to;
  Rx<YoutubeResponseBasedQ> youtubeResponseBasedQ = YoutubeResponseBasedQ().obs;
  ScrollController scrollController = ScrollController();

  static CubitController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    _loadVideos();
    _event();
  }

  void _loadVideos() async {
    YoutubeResponseBasedQ youtubeVideoResult= await youtuberRepository
        .loadCubitVideos(youtubeResponseBasedQ.value.nextPageToken ?? "");
    if (youtubeVideoResult != null &&
        youtubeVideoResult.items != null &&
        youtubeVideoResult.items!.isNotEmpty) {
      youtubeResponseBasedQ.value=youtubeVideoResult;
    }
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent &&
          youtubeResponseBasedQ.value.nextPageToken != "") {
        _loadVideos();
      }
    });
  }

}
