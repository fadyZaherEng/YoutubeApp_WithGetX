class High {
    dynamic height;
    dynamic url;
    dynamic width;

    High({this.height, this.url, this.width});

    factory High.fromJson(Map<String, dynamic> json) {
        return High(
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