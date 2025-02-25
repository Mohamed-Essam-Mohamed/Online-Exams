import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exams/core/utils/app_colors.dart';
import 'package:online_exams/features/auth/presentation/pages/register_screen.dart';

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
    return TextFormField(
      style: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  widget.obscureText ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xff454A4F),
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
        labelStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.inter(
          color: AppColors.greyColor,
          fontSize: 16,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        enabledBorder:
            outlineInputBorder(color: Colors.black, radius: 8.r, width: 1),
        focusedBorder:
            outlineInputBorder(color: Colors.black, radius: 10, width: 1),
        errorBorder:
            outlineInputBorder(color: Colors.red, radius: 10, width: 1),
        focusedErrorBorder:
            outlineInputBorder(color: Colors.red, radius: 10, width: 1),
      ),
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.validator,
    );
  }

  OutlineInputBorder outlineInputBorder(
      {required double radius, required Color color, required double width}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
