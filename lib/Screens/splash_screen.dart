import 'package:flutter/material.dart';
import 'package:quizapp/Constants/constant.dart';
import 'package:quizapp/Screens/quiz_screen.dart';
import 'package:quizapp/widgets/custom_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: const Color(0xff86948F),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                text: 'QUIZ',
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 20),
              Container(
                width: 171,
                height: 161,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/splash.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: const Color(0xffABBFB8),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                            height: 30), 
                        const CustomText(
                          text: 'Please Enter Your Name',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: TextFormField(
                            controller: nameController,
                            validator: (value) => value!.isEmpty
                                ? 'Please Enter Your Name'
                                : null,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              name = nameController.text;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const QuizScreen(),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffB8E893),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            minimumSize: const Size(108, 29),
                          ),
                          child: const CustomText(
                            text: 'Submit',
                            fontSize: 14,
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
                        width: 154,
                        height: 25,
                        decoration: BoxDecoration(
                          color: const Color(0xffB8E893),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: const Center(
                          child: CustomText(
                            text: 'WELCOME',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
