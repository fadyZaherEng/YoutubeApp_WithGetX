import 'package:youtube_app/models/youtube_model_based_q/Default.dart';
import 'package:youtube_app/models/youtube_model_based_q/High.dart';
import 'package:youtube_app/models/youtube_model_based_q/Medium.dart';

class Thumbnails {
    Default? defaults;
    High? high;
    Medium? medium;

    Thumbnails({this.defaults, this.high, this.medium});

    factory Thumbnails.fromJson(Map<String, dynamic> json) {
        return Thumbnails(
            defaults: json['default'] != null ? Default.fromJson(json['default']) : null,
            high: json['high'] != null ? High.fromJson(json['high']) : null, 
            medium: json['medium'] != null ? Medium.fromJson(json['medium']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.defaults != null) {
            data['default'] = this.defaults!.toJson();
        }
        if (this.high != null) {
            data['high'] = this.high!.toJson();
        }
        if (this.medium != null) {
            data['medium'] = this.medium!.toJson();
        }
        return data;
    }
}