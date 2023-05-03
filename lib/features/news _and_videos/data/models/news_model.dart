class NewsModel {
  String title;
  String desc;
  String image;

  NewsModel({
    required this.title,
    required this.desc,
    required this.image,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'],
      desc: json['desc'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['desc'] = desc;
    data['image'] = image;
    return data;
  }
}
