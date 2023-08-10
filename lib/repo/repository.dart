import 'package:get/get.dart';
import 'package:youtube_app/models/youtube_model_based_q/YoutubeResponseBasedQ.dart';
import 'package:youtube_app/models/youtube_mychannel_statistics/YoutubeResponseChannelInfo.dart';
import 'package:youtube_app/models/youtube_videos_statistics/YoutubeVideosStatistics.dart';

class YoutuberRepository extends GetConnect{
  static YoutuberRepository get to=>Get.find();
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl='https://www.googleapis.com/';
  }
  //based q
  Future<YoutubeResponseBasedQ> loadVideos(String nextPageToken) async {
    YoutubeResponseBasedQ? youtubeResponseBasedQ;
    String url =
        "youtube/v3/search?part=snippet&channelId=UCZQ-IQJod-Dy7VIOX7jbaiw&maxResults=10000&order=date&"
        "type=video&videoDefinition=high&key=AIzaSyAC56hVluIwEjTGr1tt3f0YvKUrK9fGECI&pageToken=$nextPageToken";
    final response = await get(url);
    if (response.status.hasError) {
      print(response.statusText.toString());
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        youtubeResponseBasedQ= YoutubeResponseBasedQ.fromJson(response.body);
        print("eeeeeeeeeeeeeeeeeeeeeee${youtubeResponseBasedQ.items![0].id!.videoId}");
      }else{
        print(response.body);
      }
    }
    return youtubeResponseBasedQ!;
  }
  Future<YoutubeResponseBasedQ> loadCubitVideos(String nextPageToken) async {
    YoutubeResponseBasedQ? youtubeResponseBasedQ;
    String url =
        "youtube/v3/search?part=snippet&channelId=UCZQ-IQJod-Dy7VIOX7jbaiw&maxResults=10000&order=date&"
        "type=video&q=cubit&videoDefinition=high&key=AIzaSyAC56hVluIwEjTGr1tt3f0YvKUrK9fGECI&pageToken=$nextPageToken";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        youtubeResponseBasedQ= YoutubeResponseBasedQ.fromJson(response.body);
      }else{
        print(response.body);
      }
    }
    return youtubeResponseBasedQ!;
  }
  Future<YoutubeResponseBasedQ> loadDesignPatternsVideos(String nextPageToken) async {
    YoutubeResponseBasedQ? youtubeResponseBasedQ;
    String url =
        "youtube/v3/search?part=snippet&channelId=UCZQ-IQJod-Dy7VIOX7jbaiw&maxResults=10000&order=date&"
        "type=video&q=designpatterns&videoDefinition=high&key=AIzaSyAC56hVluIwEjTGr1tt3f0YvKUrK9fGECI&pageToken=$nextPageToken";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        youtubeResponseBasedQ= YoutubeResponseBasedQ.fromJson(response.body);
      }else{
        print(response.body);
      }
    }
    return youtubeResponseBasedQ!;
  }
  Future<YoutubeResponseBasedQ> loadFluttersVideos(String nextPageToken) async {
    YoutubeResponseBasedQ? youtubeResponseBasedQ;
    String url =
        "youtube/v3/search?part=snippet&channelId=UCZQ-IQJod-Dy7VIOX7jbaiw&maxResults=10000&order=date&"
        "type=video&q=flutter&videoDefinition=high&key=AIzaSyAC56hVluIwEjTGr1tt3f0YvKUrK9fGECI&pageToken=$nextPageToken";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        youtubeResponseBasedQ= YoutubeResponseBasedQ.fromJson(response.body);
      }else{
        print(response.body);
      }
    }
    return youtubeResponseBasedQ!;
  }
  //search
  Future<YoutubeResponseBasedQ> searchVideos(String nextPageToken,String q) async {
    YoutubeResponseBasedQ? youtubeResponseBasedQ;
    String url =
        "youtube/v3/search?part=snippet&channelId=UCZQ-IQJod-Dy7VIOX7jbaiw&maxResults=10000&order=date&"
        "type=video&q=$q&videoDefinition=high&key=AIzaSyAC56hVluIwEjTGr1tt3f0YvKUrK9fGECI&pageToken=$nextPageToken";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        youtubeResponseBasedQ= YoutubeResponseBasedQ.fromJson(response.body);
      }else{
        print(response.body);
      }
    }
    return youtubeResponseBasedQ!;
  }
  //videos info
  Future<YoutubeVideosStatistics> getVideosInfoById(String videoId) async {
    YoutubeVideosStatistics? youtubeVideosStatistics;
    String url = "youtube/v3/videos?part=statistics&"
        "id=$videoId&key=AIzaSyAC56hVluIwEjTGr1tt3f0YvKUrK9fGECI";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        youtubeVideosStatistics= YoutubeVideosStatistics.fromJson(response.body);
        //use
        //youtubeVideosStatistics!.items![0].statistics;
      }else{
        print(response.body);
      }
    }
    return youtubeVideosStatistics!;
  }
  //channel info
  Future<YoutubeResponseChannelInfo> getChannelInfoById(String channelId) async {
    YoutubeResponseChannelInfo? youtubeResponseChannelInfo;
    String url = "youtube/v3/channels?part=statistics&part=snippet&"
        "id=$channelId&key=AIzaSyAC56hVluIwEjTGr1tt3f0YvKUrK9fGECI";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        youtubeResponseChannelInfo= YoutubeResponseChannelInfo.fromJson(response.body);
        //use
        //youtubeResponseChannelInfo!.items![0];
      }else{
        print(response.body);
      }
    }
    return youtubeResponseChannelInfo!;
  }
}
//source
//google cloud console
//youtuber developer

//all video
//cubit
//designpatterns
//flutter
//https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=UCZQ-IQJod-Dy7VIOX7jbaiw&maxResults=10000&q=flutter&order=date&type=video&videoDefinition=high&key=AIzaSyAC56hVluIwEjTGr1tt3f0YvKUrK9fGECI

//search
// /////////////////////////////////////////////////////////
// search url
// https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UCZQ-IQJod-Dy7VIOX7jbaiw&maxResults=1000&order=date&q=getx&type=video&key=AIzaSyAC56hVluIwEjTGr1tt3f0YvKUrK9fGECI
// take
// part
// order
// type
// key
// pageToken
// q=keyboard search
// id channel
// ////////////////////////////////////////////////////////////
//channls
// /////////////////////////////////////////////////////////
// channel or youtuber info url
// https://youtube.googleapis.com/youtube/v3/channels?part=statistics&part=snippet&id=UCZQ-IQJod-Dy7VIOX7jbaiw&key=AIzaSyAC56hVluIwEjTGr1tt3f0YvKUrK9fGECI
// take
// part info
// key apikey
// id equal channel id
// q
// /////////////////////////////////////////////////////////
//videos
// ////////////////////////////////////////////////////////////
// videos info
// url
// https://youtube.googleapis.com/youtube/v3/videos?part=statistics&id=DT8ryaIi5dQ&key=AIzaSyAC56hVluIwEjTGr1tt3f0YvKUrK9fGECI
// take
// video id
// part
// key
// ///////////////////////////////////////////////////////////////



