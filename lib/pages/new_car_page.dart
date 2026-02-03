import 'package:flutter/material.dart';

class NewCarPage extends StatefulWidget {
  const NewCarPage({super.key});

  @override
  State<NewCarPage> createState() => _NewCarPageState();
}

class _NewCarPageState extends State<NewCarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("New car page"),
      ),
    );
  }
}