import 'package:flutter/material.dart';

class NavigationBarScreen extends StatelessWidget {
  static const routeName = "navigation-bar";
  const NavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation Bar"),
      ),
    );
  }
}
