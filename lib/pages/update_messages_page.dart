import 'package:flutter/material.dart';

class UpdateMessagesPage extends StatefulWidget {
    final double screenWith;
  final bool isMobile;
  final double spacing;
  final List<Map<String, dynamic>> messages;
  const UpdateMessagesPage({super.key, required this.screenWith, required this.isMobile, required this.spacing, required this.messages});

  @override
  State<UpdateMessagesPage> createState() => _UpdateMessagesPageState();
}

class _UpdateMessagesPageState extends State<UpdateMessagesPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(),
        child: Center(
          child: Text("Update Messages"),
        ),
      ),
    );
  }
}