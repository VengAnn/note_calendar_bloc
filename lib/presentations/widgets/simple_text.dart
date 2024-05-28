import 'package:flutter/material.dart';
import 'package:note_schedule_remid_bloc/presentations/widgets/size_widget.dart';

class SimpleText extends StatelessWidget {
  final String text;
  final double? sizeText;
  final FontWeight fontWeight;
  final Color? textColor;

  const SimpleText({
    super.key,
    required this.text,
    this.sizeText,
    this.fontWeight = FontWeight.normal,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: sizeText ?? SizeCustomWidget.font20(context) / 1.5,
        fontWeight: fontWeight,
        color: textColor ?? Colors.black,
      ),
      textAlign: TextAlign.center,
    );
  }
}
