import 'package:flutter/material.dart';

class PromotionMessagesPage extends StatefulWidget {
  final double screenWith;
  final bool isMobile;
  final double spacing;
  final List<Map<String, dynamic>> messages;
  const PromotionMessagesPage({super.key, required this.screenWith, required this.isMobile, required this.spacing, required this.messages});

  @override
  State<PromotionMessagesPage> createState() => _PromotionMessagesPageState();
}

class _PromotionMessagesPageState extends State<PromotionMessagesPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(),
        child: Center(
          child: Text("Promotion Messages"),
        ),
      ),
    );
  }
}