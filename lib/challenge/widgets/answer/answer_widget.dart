import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {

  final String title;
  final bool isCorrect;
  final bool isSelected;

  const AnswerWidget({
    Key? key,
    required this.title,
    this.isCorrect = false,
    this.isSelected = false
  }) : super(key: key);
  
  Color get _selectedColorCorrect => isCorrect ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderCorrect => isCorrect ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardCorrect => isCorrect ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardCorrect => isCorrect ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleCorrect => isCorrect ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconCorrect => isCorrect ? Icons.check : Icons.close;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? _selectedColorCardCorrect : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
            BorderSide(color: isSelected ? _selectedBorderCardCorrect : AppColors.border)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title, style:
                isSelected ? _selectedTextStyleCorrect : AppTextStyles.body
              )
            ),
            Container(
              decoration: BoxDecoration(
                color: isSelected ? _selectedColorCorrect : AppColors.white,
                borderRadius: BorderRadius.circular(500),
                border: Border.fromBorderSide(
                  BorderSide(color: isSelected ? _selectedBorderCorrect : AppColors.border)
                )
              ),
              child: isSelected
                ? Icon(
                  _selectedIconCorrect,
                  size: 16,
                  color: Colors.white,
                )
                : null,
              height: 24,
              width: 24,
            )
          ],
        ),
      ),
    );
  }
}