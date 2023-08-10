class Statistics {
    dynamic commentCount;
    dynamic favoriteCount;
    dynamic likeCount;
    dynamic viewCount;
    dynamic dislikeCount;
    dynamic subscribeCount;

    Statistics({this.commentCount, this.favoriteCount, this.likeCount, this.viewCount,this.dislikeCount,this.subscribeCount});

    factory Statistics.fromJson(Map<String, dynamic> json) {
        return Statistics(
            commentCount: json['commentCount'],
            dislikeCount: json['dislikeCount'],
            subscribeCount: json['subscribeCount'],
            favoriteCount: json['favoriteCount'],
            likeCount: json['likeCount'], 
            viewCount: json['viewCount'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['commentCount'] = this.commentCount;
        data['subscribeCount'] = this.subscribeCount;
        data['dislikeCount'] = this.dislikeCount;
        data['favoriteCount'] = this.favoriteCount;
        data['likeCount'] = this.likeCount;
        data['viewCount'] = this.viewCount;
        return data;
    }
}