class Message {
  String sender;
  String recipient;
  String message;

  Message(
      {required this.sender, required this.recipient, required this.message});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      sender: json['sender'],
      recipient: json['recipient'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() => {
        'sender': sender,
        'recipient': recipient,
        'message': message,
      };
}
