class Localized {
    dynamic description;
    dynamic title;

    Localized({this.description, this.title});

    factory Localized.fromJson(Map<String, dynamic> json) {
        return Localized(
            description: json['description'], 
            title: json['title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['description'] = this.description;
        data['title'] = this.title;
        return data;
    }
}