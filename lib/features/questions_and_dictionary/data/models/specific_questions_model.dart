class SpecificQuestioncModel {
  String question;
  String answer;

  SpecificQuestioncModel({
    required this.question,
    required this.answer,
  });

  factory SpecificQuestioncModel.fromJson(Map<String, dynamic> json) {
    return SpecificQuestioncModel(
      question: json['question'],
      answer: json['answer'],
    );
  }
}
