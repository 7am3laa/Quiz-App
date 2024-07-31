import 'package:flutter/material.dart';
import 'package:quizapp/Constants/constant.dart';
import 'package:quizapp/Screens/quiz_screen.dart';
import 'package:quizapp/utils/question_bank.dart';

import '../widgets/custom_text.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionBank questionBank = QuestionBank();
    return Scaffold(
      backgroundColor: const Color(0xff86948F),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 390,
              height: 300,
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              decoration: BoxDecoration(
                color: const Color(0xffABBFB8),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  CustomText(
                    text: 'HELLO ${name.toUpperCase()} YOUR SCORE IS',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(height: 20),
                  CustomText(
                    text: '$score / ${questionBank.allQuestions()}',
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuizScreen(),
                        ),
                      );
                      questionBank.reset();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffB8E893),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      minimumSize: const Size(200, 40),
                    ),
                    child: const CustomText(
                      text: 'Back To Start',
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -10,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 250,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffB8E893),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Center(
                    child: CustomText(
                      text: 'Congratulations!!!',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
