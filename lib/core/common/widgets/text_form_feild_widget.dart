import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exams/core/utils/app_light_theme.dart';

import '../../utils/app_colors.dart';

typedef Validator = String? Function(String?);

class TextFormFieldWidget extends StatefulWidget {
  final String label;
  final String hintText;
  final TextInputType keyboardType;
  bool obscureText;
  final bool isPassword;
  final TextEditingController controller;
  final Validator validator;

  TextFormFieldWidget({
    required this.label,
    required this.controller,
    required this.validator,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.isPassword = false,
    super.key,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppThemeExtension>()!;

    return TextFormField(
      style: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: colorTheme.black,
      ),
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  widget.obscureText ? Icons.visibility_off : Icons.visibility,
                  color: colorTheme.blackIcon,
                  size: 24,
                ),
                onPressed: () {
                  setState(
                    () {
                      widget.obscureText = !widget.obscureText;
                    },
                  );
                },
              )
            : null,
        labelText: widget.label,
        hintText: widget.hintText,
      ),
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.validator,
    );
  }
}
