import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/result/result_page.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:devquiz/shared/widgets/next_button/next_button_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {

  final String title;
  final List<QuestionModel> questions;

  const ChallengePage({Key? key, required this.title, required this.questions }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {

  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    controller.currentPageNotifier.addListener(() {
      setState(() {});
    });

    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });

    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length) 
      pageController.nextPage(duration: Duration(milliseconds: 100), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value,
                  length: widget.questions.length,
                )
              )
            ],
          ),
          top: true
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
          .map((e) => QuizWidget(
              model: e,
              onSelected: (isCorrect) {
                if (isCorrect)
                  controller.counterCorrectAnswer++;

                nextPage();
              },
            )
          )
          .toList()
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (value < widget.questions.length)
                  Expanded(
                    child: NextButtonWidget.white(
                      label: 'Pular',
                      onTap: nextPage
                    )
                  ),

                if (value == widget.questions.length)
                  Expanded(
                    child: NextButtonWidget.green(
                      label: 'Confirmar',
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => ResultPage(
                              title: widget.title,
                              length: widget.questions.length,
                              counterCorrectAnswer: controller.counterCorrectAnswer,
                            )
                          )
                        );
                      }
                    )
                  )
              ],
            )
          ),
        ),
      ),
    );
  }
}