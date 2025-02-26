import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exams/core/extensions/navigator_extention.dart';
import 'package:online_exams/features/auth/presentation/pages/forget_pass_screen.dart';

class SectionRememberForget extends StatefulWidget {
  const SectionRememberForget({
    super.key,
  });

  @override
  State<SectionRememberForget> createState() => _SectionRememberForgetState();
}

class _SectionRememberForgetState extends State<SectionRememberForget> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: isCheck,
              onChanged: (value) {
                isCheck = value!;
                setState(() {});
              },
              visualDensity: VisualDensity.compact,
            ),
            const Text(
              "Remember me",
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            context.pushNamed(ForgetPassScreen.routeName);
          },
          child: Text(
            "Forget password?",
            style: GoogleFonts.inter(
              decoration: TextDecoration.underline,
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
