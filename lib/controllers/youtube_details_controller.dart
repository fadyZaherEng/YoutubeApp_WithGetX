import 'package:get/get.dart';
import 'package:youtube_app/controllers/video_controller.dart';
import 'package:youtube_app/models/youtube_model_based_q/Item.dart';
import 'package:youtube_app/models/youtube_mychannel_statistics/Item.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_app/models/youtube_videos_statistics/Statistics.dart';

class YoutubeDetailsController extends GetxController{
  Rx<Video> video = Video().obs;
  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;
  YoutubePlayerController? playController;

  @override
  void onInit() {
    VideoController videoController = Get.find(tag: Get.parameters["videoId"]);
    video(videoController.video);
    statistics(videoController.statistics.value);
    youtuber(videoController.youtuber.value);
    _event();
    super.onInit();
  }
  void _event(){
    playController = YoutubePlayerController(
      initialVideoId: video.value.id!.videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }
}