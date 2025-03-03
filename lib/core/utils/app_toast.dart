import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

abstract class AppToast {
  static void showToast({
    required BuildContext context,
    required String title,
    required String description,
    required ToastificationType type,
  }) {
    toastification.show(
      context: context,
      type: type,
      title: Text(
        title,
        style: AppTextStyles.size14CP
            .copyWith(fontWeight: FontWeight.bold, color: AppColors.scaffold),
      ),
      description: Text(
        description,
        style: AppTextStyles.size14CP.copyWith(
          fontWeight: FontWeight.w300,
          color: AppColors.scaffold,
          fontSize: 12,
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      primaryColor: AppColors.primary,
      autoCloseDuration: const Duration(seconds: 4),
      progressBarTheme: ProgressIndicatorThemeData(
        color: type == ToastificationType.success
            ? Colors.green
            : type == ToastificationType.info
                ? Colors.blue
                : type == ToastificationType.warning
                    ? Colors.orange
                    : Colors.red,
      ),
      showProgressBar: true,
      backgroundColor: type == ToastificationType.success
          ? Colors.green
          : type == ToastificationType.info
              ? Colors.blue
              : type == ToastificationType.warning
                  ? Colors.orange
                  : Colors.red,
      foregroundColor: Colors.white,
    );
  }
}
