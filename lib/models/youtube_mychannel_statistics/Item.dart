import 'package:youtube_app/models/youtube_model_based_q/Snippet.dart';
import 'package:youtube_app/models/youtube_mychannel_statistics/Statistics.dart';

class Youtuber {
    dynamic etag;
    dynamic id;
    dynamic kind;
    Snippet? snippet;
    Statistics? statistics;

    Youtuber({this.etag, this.id, this.kind, this.snippet, this.statistics});

    factory Youtuber.fromJson(Map<String, dynamic> json) {
        return Youtuber(
            etag: json['etag'], 
            id: json['id'], 
            kind: json['kind'], 
            snippet: json['snippet'] != null ? Snippet.fromJson(json['snippet']) : null, 
            statistics: json['statistics'] != null ? Statistics.fromJson(json['statistics']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['etag'] = this.etag;
        data['id'] = this.id;
        data['kind'] = this.kind;
        if (this.snippet != null) {
            data['snippet'] = this.snippet!.toJson();
        }
        if (this.statistics != null) {
            data['statistics'] = this.statistics!.toJson();
        }
        return data;
    }
}