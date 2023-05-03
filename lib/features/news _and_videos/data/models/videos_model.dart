class VideosModel {
  String title;
  String desc;
  String link;

  VideosModel({
    required this.title,
    required this.desc,
    required this.link,
  });

  factory VideosModel.fromJson(Map<String, dynamic> json) {
    return VideosModel(
      title: json['title'],
      desc: json['desc'],
      link: json['link'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['desc'] = desc;
    data['link'] = link;
    return data;
  }
}
