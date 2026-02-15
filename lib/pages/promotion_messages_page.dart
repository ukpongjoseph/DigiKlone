import 'package:flutter/material.dart';

class PromotionMessagesPage extends StatefulWidget {
  final double screenWith;
  final bool isMobile;
  final double spacing;
  const PromotionMessagesPage({super.key, required this.screenWith, required this.isMobile, required this.spacing});

  @override
  State<PromotionMessagesPage> createState() => _PromotionMessagesPageState();
}

class _PromotionMessagesPageState extends State<PromotionMessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Center(
        child: Text("Promotion Messages"),
      ),
    );
  }
}