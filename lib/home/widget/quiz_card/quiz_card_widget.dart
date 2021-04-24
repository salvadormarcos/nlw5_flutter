import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {

  final QuizModel quiz;
  final VoidCallback onTap;

  const QuizCardWidget({Key? key, required this.quiz, required this.onTap }) : super(key: key);

  Image get _image => Image.asset('assets/images/${quiz.image}.png');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(color: AppColors.border)
          ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: _image,
            ),
            SizedBox(height: 24,),
            Text(
              quiz.title,
              style: AppTextStyles.heading15
            ),
            SizedBox(height: 24,),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    '${quiz.questionAnswered}/${quiz.questions.length}',
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ProgressIndicatorWidget(value: quiz.questionAnswered / quiz.questions.length),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}