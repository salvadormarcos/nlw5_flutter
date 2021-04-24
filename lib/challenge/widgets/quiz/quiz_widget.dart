import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  
  final QuestionModel model;
  final ValueChanged<bool> onSelected;

  const QuizWidget({Key? key, required this.model, required this.onSelected }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {

  int indexSelecionado = -1;

  AnswerModel answers(int index) => widget.model.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.model.title, style: AppTextStyles.heading),
          SizedBox(height: 24),

          for (var i = 0; i < widget.model.answers.length; i++)
            AnswerWidget(
              model: answers(i),
              isSelected: indexSelecionado == i,
              disabled: indexSelecionado != -1,
              onTap: (isCorrect) {
                indexSelecionado = i;

                setState(() { });

                Future.delayed(Duration(milliseconds: 500))
                  .then((_) => widget.onSelected(isCorrect));
              },
            ),
        ],
      )
    );
  }
}