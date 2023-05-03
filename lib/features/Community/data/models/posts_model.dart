class PostsModel {
  String id;
  String user;
  String image;
  String text;
  List<String> likes;
  DateTime createdAt;
  DateTime updatedAt;

  PostsModel({
    required this.id,
    required this.user,
    required this.image,
    this.text = "",
    required this.likes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      id: json['_id'],
      user: json['user'],
      image: json['image'],
      text: json['text'] ?? "",
      likes: List<String>.from(json['likes']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['user'] = user;
    data['image'] = image;
    data['text'] = text;
    data['likes'] = likes;
    data['createdAt'] = createdAt.toIso8601String();
    data['updatedAt'] = updatedAt.toIso8601String();
    return data;
  }
}
