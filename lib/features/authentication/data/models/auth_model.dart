class AuthlModel {
  String id;
  String name;
  String email;
  String token;

  AuthlModel({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });

  factory AuthlModel.fromJson(Map<String, dynamic> json) {
    return AuthlModel(
      id: json['user']['_id'],
      token: json['token'],
      name: json['user']['name'],
      email: json['user']['email'],
    );
  }
}
