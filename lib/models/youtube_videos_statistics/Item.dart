import 'package:youtube_app/models/youtube_videos_statistics/Statistics.dart';

class Item {
    dynamic etag;
    dynamic id;
    dynamic kind;
    Statistics? statistics;

    Item({this.etag, this.id, this.kind, this.statistics});

    factory Item.fromJson(Map<String, dynamic> json) {
        return Item(
            etag: json['etag'], 
            id: json['id'], 
            kind: json['kind'], 
            statistics: json['statistics'] != null ? Statistics.fromJson(json['statistics']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['etag'] = this.etag;
        data['id'] = this.id;
        data['kind'] = this.kind;
        if (this.statistics != null) {
            data['statistics'] = this.statistics!.toJson();
        }
        return data;
    }
}