import 'package:flutter/material.dart';
import 'package:quizapp/Screens/result_screen.dart';
import 'package:quizapp/utils/question_bank.dart';
import 'package:quizapp/widgets/custom_text.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final QuestionBank questionBank = QuestionBank();
  String? selectedAnswer;

  void nextQuestion() {
    setState(() {
      questionBank.move();
      selectedAnswer = null;
      if (questionBank.isEnd) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ResultScreen(),
          ),
        );
      }
    });
  }

  void checkAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
      questionBank.check(answer);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questionBank.getQuestion();

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'QUIZ',
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: 171,
                  height: 161,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/splash.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xffB8E893),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomText(
                          text:
                              '${questionBank.idx + 1} / ${questionBank.allQuestions()}',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomText(
                        text: currentQuestion.questionText,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(height: 10),
                      for (var answer in currentQuestion.answer)
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: selectedAnswer == answer
                              ? const Color(0xff50997F)
                              : Colors.white,
                          child: ListTile(
                            title: CustomText(
                              text: answer,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: selectedAnswer == answer
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            onTap: () {
                              checkAnswer(answer);
                            },
                          ),
                        ),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff86948F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            minimumSize: const Size(200, 35),
                          ),
                          onPressed: nextQuestion,
                          child: CustomText(
                            text: questionBank.isEnd ? 'Show Result' : 'Next',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
