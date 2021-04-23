import 'dart:convert';

import 'question_model.dart';

enum Level { facil, medio, dificil, perito }

extension StringToLevelExt on String {

  Level get asLevel => {
    'facil': Level.facil,
    'medio': Level.medio,
    'dificil': Level.dificil,
    'perito': Level.perito,
  }[this]!;

}

extension LevelToStringExt on Level {

  String get name => {
    Level.facil: 'facil',
    Level.medio: 'medio',
    Level.dificil: 'dificil',
    Level.perito: 'perito',
  }[this]!;

}


class QuizModel {
  
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final String image;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionAnswered = 0,
    required this.image,
    required this.level
  });



  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswered': questionAnswered,
      'image': image,
      'level': level.name,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionAnswered: map['questionAnswered'],
      image: map['image'],
      level: map['level'].toString().asLevel,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source));
}
