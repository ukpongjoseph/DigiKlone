import 'package:flutter/material.dart';

class AllMessagePage extends StatefulWidget {
  final double screenWith;
  final bool isMobile;
  final double spacing;
  const AllMessagePage({super.key, required this.screenWith, required this.isMobile, required this.spacing});

  @override
  State<AllMessagePage> createState() => _AllMessagePageState();
}

class _AllMessagePageState extends State<AllMessagePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Center(child: Text("All Messages")),
    );
  }
}
