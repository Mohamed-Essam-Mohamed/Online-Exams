import 'package:flutter/material.dart';
import 'package:online_exams/core/utils/app_light_theme.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    super.key,
    required this.text,
    required this.subText,
    required this.onTap,
  });
  final String text;
  final String subText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppThemeExtension>()!;

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: AppTextStyles.size16CP,
          ),
          WidgetSpan(
            child: GestureDetector(
              onTap: onTap,
              child: Text(
                subText,
                style: AppTextStyles.size16CP.copyWith(
                  color: colorTheme.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
