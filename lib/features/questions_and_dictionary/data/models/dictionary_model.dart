class DictionaryModel {
  String title;
  String desc;

  DictionaryModel({
    required this.title,
    required this.desc,
  });

  factory DictionaryModel.fromJson(Map<String, dynamic> json) {
    return DictionaryModel(
      title: json['title'],
      desc: json['desc'],
    );
  }
}
