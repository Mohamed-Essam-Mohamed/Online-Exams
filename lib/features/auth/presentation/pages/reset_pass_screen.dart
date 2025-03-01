import 'package:flutter/material.dart';
import 'package:online_exams/core/extensions/navigator_extention.dart';

class ResetPassScreen extends StatelessWidget {
  static const String routeName = 'resetPass';
  const ResetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Password"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop();
          },
        ),
      ),
    );
  }
}
