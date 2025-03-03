import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class ResendButtonWidget extends StatefulWidget {
  const ResendButtonWidget({required this.resendFunction, super.key});
  final void Function() resendFunction;

  @override
  State<ResendButtonWidget> createState() => _ResendButtonWidgetState();
}

class _ResendButtonWidgetState extends State<ResendButtonWidget> {
  bool _isResendAgain = false;
  bool _isVerified = false;
  bool _isLoading = false;
  String _code = '';
  late Timer _timer;
  int _start = 60;
  //////////////////////////////////////////
  void resend() {
    setState(() {
      _isResendAgain = true;
    });

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          if (_start == 0) {
            _isResendAgain = false;
            _start = 60;
            timer.cancel();
          } else {
            _start--;
          }
        });
      },
    );
  }

  void verify() {
    setState(() {
      _isLoading = true;
    });
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        _isLoading = false;
        _isVerified = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Dont't receive code?",
          style: AppTextStyles.size16CP,
        ),
        TextButton(
          onPressed: () {
            if (_isResendAgain) return;
            resend();
            widget.resendFunction();
          },
          child: Text(
            _isResendAgain == true ? "Try again in $_start" : 'Resend',
            style: AppTextStyles.size16CP.copyWith(
              color: AppColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
