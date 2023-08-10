class Statistics {
    dynamic hiddenSubscriberCount;
    dynamic subscriberCount;
    dynamic videoCount;
    dynamic viewCount;

    Statistics({this.hiddenSubscriberCount, this.subscriberCount, this.videoCount, this.viewCount});

    factory Statistics.fromJson(Map<String, dynamic> json) {
        return Statistics(
            hiddenSubscriberCount: json['hiddenSubscriberCount'], 
            subscriberCount: json['subscriberCount'], 
            videoCount: json['videoCount'], 
            viewCount: json['viewCount'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['hiddenSubscriberCount'] = this.hiddenSubscriberCount;
        data['subscriberCount'] = this.subscriberCount;
        data['videoCount'] = this.videoCount;
        data['viewCount'] = this.viewCount;
        return data;
    }
}