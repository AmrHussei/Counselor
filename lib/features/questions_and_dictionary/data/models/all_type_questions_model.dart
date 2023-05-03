class AllQuestionModel {
  String id;
  String title;
  String image;

  AllQuestionModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory AllQuestionModel.fromJson(Map<String, dynamic> json) {
    return AllQuestionModel(
      id: json['_id'],
      title: json['title'],
      image: json['image'],
    );
  }
}
