import 'package:quizapp/Constants/constant.dart';
import 'package:quizapp/Models/questions.dart';

class QuestionBank {
  int idx = 0;
  bool isEnd = false;
  bool answeredCorrectly = false;

  final List<Question> _myQuestionBank = [
    Question(
      questionText:
          "A flashing red traffic light signifies that a driver should do what?",
      answer: [
        'stop',
        'speed up',
        'proceed with caution',
        'honk the horn',
      ],
      answerIndex: 0,
    ),
    Question(
      questionText: "Are you okay ?",
      answer: [
        'thar',
        'kalahari',
        'himalaya',
        'everest',
      ],
      answerIndex: 1,
    ),
    Question(
      questionText: "Is Dart Easy ?",
      answer: [
        'thar',
        'kalahari',
        'himalaya',
        'everest',
      ],
      answerIndex: 1,
    ),
    Question(
      questionText: "Do you hate Flutter ?",
      answer: [
        'thar',
        'kalahari',
        'himalaya',
        'everest',
      ],
      answerIndex: 1,
    ),
  ];

  Question getQuestion() {
    return _myQuestionBank[idx];
  }

  int allQuestions() {
    return _myQuestionBank.length;
  }

  void check(String answer) {
    var correctAnswer =
        _myQuestionBank[idx].answer[_myQuestionBank[idx].answerIndex];
    if (answer == correctAnswer && !answeredCorrectly) {
      score++;
      answeredCorrectly = true;
    }
  }

  void move() {
    if (idx >= _myQuestionBank.length - 1) {
      isEnd = true;
      status = score > allQuestions() / 2 ? "win" : "lose";
    } else {
      idx++;
      answeredCorrectly = false;
    }
  }

  void reset() {
    idx = 0;
    score = 0;
    status = '';
    isEnd = false;
    answeredCorrectly = false;
  }
}
