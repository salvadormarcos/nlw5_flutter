import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/next_button/next_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {

  final String title;
  final int length;
  final int counterCorrectAnswer;

  const ResultPage({Key? key, required this.title, required this.length, required this.counterCorrectAnswer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(AppImages.trophy),
                Text(
                  'Parabéns!',
                  style: AppTextStyles.heading40
                ),
                SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    text: 'Você concluiu',
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                        text: '\n$title',
                        style: AppTextStyles.bodyBold
                      ),
                      TextSpan(
                        text: '\ncom $counterCorrectAnswer de $length acertos.',
                        style: AppTextStyles.body
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.purple(
                          label: 'Compartilhar',
                          onTap: () {                           
                            Share.share([
                              'DevQuiz NLW #5 Flutter',
                              'REsultado do Quiz: "$title"',
                              'Obtive ${ (counterCorrectAnswer / length * 100).toInt() }% de aproveitamento!'
                            ].join('\n'));
                          }
                        ),
                      )
                    )
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.white(
                          label: 'Voltar ao início',
                          onTap: () {
                            Navigator.pop(context);
                          }
                        ),
                      )
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      )
    );
  }

}