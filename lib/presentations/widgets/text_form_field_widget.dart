import 'package:flutter/material.dart';
import 'package:note_schedule_remid_bloc/presentations/widgets/simple_text.dart';
import 'package:note_schedule_remid_bloc/constants/app_color.dart';
import 'package:note_schedule_remid_bloc/presentations/widgets/size_widget.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String titleText;
  final IconData icon;
  final IconData? iconSuffix;
  final bool showIconSuffix;
  final VoidCallback? onTap;
  final bool obscureText;

  const TextFormFieldWidget({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.titleText,
    required this.icon,
    this.iconSuffix,
    this.showIconSuffix = false,
    this.obscureText = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //text
        SimpleText(
          text: titleText,
          textColor: AppColor.colorGrey,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.all(
              Radius.circular(SizeCustomWidget.radius2percent(context)),
            ),
          ),
          child: TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(icon),
              hintText: hintText,
              suffixIcon: showIconSuffix == true
                  ? GestureDetector(
                      onTap: onTap,
                      child: Icon(iconSuffix),
                    )
                  : const SizedBox(),
            ),
            obscureText: obscureText,
          ),
        ),
      ],
    );
  }
}
