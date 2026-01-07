import 'package:flutter/material.dart';

class CreateDigiLock extends StatefulWidget {
  const CreateDigiLock({super.key});

  @override
  State<CreateDigiLock> createState() => _CreateDigiLockState();
}

class _CreateDigiLockState extends State<CreateDigiLock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("First create digiLock page"),),
    );
  }
}