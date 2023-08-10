import 'package:get/get.dart';
import 'package:youtube_app/models/youtube_model_based_q/Item.dart';
import 'package:youtube_app/models/youtube_mychannel_statistics/Item.dart';
import 'package:youtube_app/models/youtube_mychannel_statistics/YoutubeResponseChannelInfo.dart';
import 'package:youtube_app/models/youtube_videos_statistics/Statistics.dart';
import 'package:youtube_app/models/youtube_videos_statistics/YoutubeVideosStatistics.dart';
import 'package:youtube_app/repo/repository.dart';

class VideoController extends GetxController {
  Video video;
  VideoController({required this.video});

  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;

  @override
  void onInit() async {
    super.onInit();
    YoutubeVideosStatistics youtubeVideosStatistics =
        await YoutuberRepository.to.getVideosInfoById(video.id!.videoId);
    statistics(youtubeVideosStatistics.items![0].statistics);

    YoutubeResponseChannelInfo youtubeResponseChannelInfo =
        await YoutuberRepository.to
            .getChannelInfoById(video.snippet!.channelId);
    youtuber(youtubeResponseChannelInfo.items![0]);
  }

  String get viewContString=>"views ${statistics.value.viewCount??'-'}";
  String get youtuberThumbnailsUrl{
    if(youtuber.value.snippet!.thumbnails==null){
      return "link";
    }else{
      return youtuber.value.snippet!.thumbnails!.medium!.url;
    }
  }
}
