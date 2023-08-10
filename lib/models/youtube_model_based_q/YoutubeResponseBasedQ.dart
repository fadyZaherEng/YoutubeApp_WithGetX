import 'package:youtube_app/models/youtube_model_based_q/Item.dart';
import 'package:youtube_app/models/youtube_model_based_q/PageInfo.dart';

class YoutubeResponseBasedQ {
    dynamic etag;
    List<Video>? items;
    dynamic kind;
    dynamic nextPageToken;
    PageInfo? pageInfo;
    dynamic regionCode;

    YoutubeResponseBasedQ({this.etag, this.items, this.kind, this.nextPageToken, this.pageInfo, this.regionCode});

    factory YoutubeResponseBasedQ.fromJson(Map<String, dynamic> json) {
        return YoutubeResponseBasedQ(
            etag: json['etag'], 
            items: json['items'] != null ? (json['items'] as List).map((i) => Video.fromJson(i)).toList() : null,
            kind: json['kind'], 
            nextPageToken: json['nextPageToken'], 
            pageInfo: json['pageInfo'] != null ? PageInfo.fromJson(json['pageInfo']) : null, 
            regionCode: json['regionCode'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['etag'] = this.etag;
        data['kind'] = this.kind;
        data['nextPageToken'] = this.nextPageToken;
        data['regionCode'] = this.regionCode;
        if (this.items != null) {
            data['items'] = this.items!.map((v) => v.toJson()).toList();
        }
        if (this.pageInfo != null) {
            data['pageInfo'] = this.pageInfo!.toJson();
        }
        return data;
    }
}