import 'package:youtube_app/models/youtube_model_based_q/Id.dart';
import 'package:youtube_app/models/youtube_model_based_q/Snippet.dart';

class Video {
    dynamic etag;
    Id? id;
    dynamic kind;
    Snippet? snippet;

    Video({this.etag, this.id, this.kind, this.snippet});

    factory Video.fromJson(Map<String, dynamic> json) {
        return Video(
            etag: json['etag'], 
            id: json['id'] != null ? Id.fromJson(json['id']) : null, 
            kind: json['kind'], 
            snippet: json['snippet'] != null ? Snippet.fromJson(json['snippet']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['etag'] = this.etag;
        data['kind'] = this.kind!;
        if (this.id != null) {
            data['id'] = this.id!.toJson();
        }
        if (this.snippet != null) {
            data['snippet'] = this.snippet!.toJson();
        }
        return data;
    }
}