import 'package:youtube_app/models/youtube_model_based_q/Thumbnails.dart';

class Snippet {
    dynamic channelId;
    dynamic channelTitle;
    dynamic description;
    dynamic liveBroadcastContent;
    dynamic publishTime;
    dynamic publishedAt;
    Thumbnails? thumbnails;
    dynamic title;

    Snippet({this.channelId, this.channelTitle, this.description, this.liveBroadcastContent, this.publishTime, this.publishedAt, this.thumbnails, this.title});

    factory Snippet.fromJson(Map<String, dynamic> json) {
        return Snippet(
            channelId: json['channelId'], 
            channelTitle: json['channelTitle'], 
            description: json['description'], 
            liveBroadcastContent: json['liveBroadcastContent'], 
            publishTime: json['publishTime'], 
            publishedAt: json['publishedAt'], 
            thumbnails: json['thumbnails'] != null ? Thumbnails.fromJson(json['thumbnails']) : null, 
            title: json['title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['channelId'] = this.channelId;
        data['channelTitle'] = this.channelTitle;
        data['description'] = this.description;
        data['liveBroadcastContent'] = this.liveBroadcastContent;
        data['publishTime'] = this.publishTime;
        data['publishedAt'] = this.publishedAt;
        data['title'] = this.title;
        if (this.thumbnails != null) {
            data['thumbnails'] = this.thumbnails!.toJson();
        }
        return data;
    }
}