import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_app/models/youtube_model_based_q/YoutubeResponseBasedQ.dart';
import 'package:youtube_app/repo/repository.dart';
//اليتوتيوب مش بيرجع كل الفيديو مره واحده بيديك اول مره نيكست باج توكن تستخدمه
//وانت بتعمل اسكرول وخلصت تستخدمه وتعمل كول تاني تجيب تاني منه وهكذا لحد ما يرجع كل الفيديو

class SearchYoutubeController extends GetxController {
  YoutuberRepository youtuberRepository = YoutuberRepository.to;
  Rx<YoutubeResponseBasedQ> youtubeResponseBasedQ = YoutubeResponseBasedQ().obs;
  ScrollController scrollController = ScrollController();
  static SearchYoutubeController get to => Get.find();
  String key = "searchKey";
  RxList<String> history = RxList<String>.empty(growable: true);
  SharedPreferences? _profs;
  String _currentKeyword="";

  @override
  void onInit() async {
    _event();
    _profs = await SharedPreferences.getInstance();
    RxList<String> initData = (_profs!.get(key) ?? []) as RxList<String>;
    //first
    //history.value=RxList.from(initData);
    //or
    history(RxList.from(initData));
    //or
    //history(initData.map<String>((_) => _.toString()).toList());
    super.onInit();
  }
  void submitSearch(String searchKey) {
    history.addIf(!history.contains(searchKey), searchKey);
    _profs!.setStringList(key, history);
    _currentKeyword = searchKey;
    _searchVideos(searchKey);
  }

  void _searchVideos(String searchKey) async {
    YoutubeResponseBasedQ youtubeVideoResult= await youtuberRepository
        .searchVideos(youtubeResponseBasedQ.value.nextPageToken ?? "",searchKey);
    if (youtubeVideoResult != null &&
        youtubeVideoResult.items != null &&
        youtubeVideoResult.items!.isNotEmpty) {
      youtubeResponseBasedQ.update((youtube) {
        youtube!.nextPageToken = youtubeVideoResult.nextPageToken;
        youtube.items!.addAll(youtubeVideoResult.items!);
      });
    }
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent &&
          youtubeResponseBasedQ.value.nextPageToken != "") {
        _searchVideos(_currentKeyword);
      }
    });
  }


}
