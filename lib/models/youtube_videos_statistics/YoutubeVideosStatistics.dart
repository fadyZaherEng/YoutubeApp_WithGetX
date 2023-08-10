

import 'package:youtube_app/models/youtube_videos_statistics/Item.dart';
import 'package:youtube_app/models/youtube_videos_statistics/PageInfo.dart';

class YoutubeVideosStatistics {
    dynamic etag;
    List<Item>? items;
    dynamic kind;
    PageInfo? pageInfo;

    YoutubeVideosStatistics({this.etag, this.items, this.kind, this.pageInfo});

    factory YoutubeVideosStatistics.fromJson(Map<String, dynamic> json) {
        return YoutubeVideosStatistics(
            etag: json['etag'], 
            items: json['items'] != null ? (json['items'] as List).map((i) => Item.fromJson(i)).toList() : null, 
            kind: json['kind'], 
            pageInfo: json['pageInfo'] != null ? PageInfo.fromJson(json['pageInfo']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['etag'] = this.etag;
        data['kind'] = this.kind;
        if (this.items != null) {
            data['items'] = this.items!.map((v) => v.toJson()).toList();
        }
        if (this.pageInfo != null) {
            data['pageInfo'] = this.pageInfo!.toJson();
        }
        return data;
    }
}