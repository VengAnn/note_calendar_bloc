import 'package:flutter/material.dart';
import 'package:note_schedule_remid_bloc/presentations/widgets/size_widget.dart';
import 'package:note_schedule_remid_bloc/presentations/widgets/simple_text.dart';

class LanguageOption extends StatelessWidget {
  final String textLanguage;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;
  final double? sizeText;

  const LanguageOption({
    super.key,
    required this.textLanguage,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
    this.sizeText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: SizeCustomWidget.hiegth9percent(context)),
        padding: EdgeInsets.all(SizeCustomWidget.width1percent(context)),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 2,
          ),
          borderRadius:
              BorderRadius.circular(SizeCustomWidget.radius1percent(context)),
        ),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: SizeCustomWidget.width1percent(context) * 2.5,
            ),
            SizedBox(height: SizeCustomWidget.width5(context)),
            SimpleText(
              text: textLanguage,
              fontWeight: FontWeight.bold,
              sizeText: sizeText,
            ),
          ],
        ),
      ),
    );
  }
}
