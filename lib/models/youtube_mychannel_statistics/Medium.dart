class Medium {
    dynamic height;
    dynamic url;
    dynamic width;

    Medium({this.height, this.url, this.width});

    factory Medium.fromJson(Map<String, dynamic> json) {
        return Medium(
            height: json['height'], 
            url: json['url'], 
            width: json['width'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['height'] = this.height;
        data['url'] = this.url;
        data['width'] = this.width;
        return data;
    }
}