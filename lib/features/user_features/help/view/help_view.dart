import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(child: Text("Help & FAQs", style: TextStyle(fontSize: 20))),
    );
  }
}
