import 'package:flutter/material.dart';

class TotalProgress extends StatefulWidget {
  const TotalProgress({super.key});

  @override
  State<TotalProgress> createState() => _TotalProgressState();
}

class _TotalProgressState extends State<TotalProgress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          Text("Total Progress page")
        ],
      ),
    );
  }
}