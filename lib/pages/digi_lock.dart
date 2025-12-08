import 'package:flutter/material.dart';

class DigiLock extends StatefulWidget {
  const DigiLock({super.key});

  @override
  State<DigiLock> createState() => _DigiLockState();
}

class _DigiLockState extends State<DigiLock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [Text("Digi Lock Page")]),
    );
  }
}
