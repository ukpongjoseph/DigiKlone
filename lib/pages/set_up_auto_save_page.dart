import 'package:flutter/material.dart';

class SetUpAutoSavePage extends StatefulWidget {
  const SetUpAutoSavePage({super.key});

  @override
  State<SetUpAutoSavePage> createState() => _SetUpAutoSavePageState();
}

class _SetUpAutoSavePageState extends State<SetUpAutoSavePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("SetUp auto save Page")),
    );
  }
}
