import 'package:flutter/material.dart';
import 'package:second_flutter/components/dream_vacation.dart';
import 'package:second_flutter/components/target_top_card.dart';

class DigiTarget extends StatefulWidget {
  const DigiTarget({super.key});

  @override
  State<DigiTarget> createState() => _DigiTargetState();
}

class _DigiTargetState extends State<DigiTarget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 27, 74, 33),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
              colors: [
                const Color.fromARGB(255, 27, 74, 33),
                const Color.fromARGB(255, 23, 63, 28),
                const Color.fromARGB(255, 18, 55, 22),
                const Color.fromARGB(255, 32, 67, 36),
                const Color.fromARGB(255, 16, 39, 44),
              ]
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TargetTopCard(),
              SizedBox(height: 10,),
              Text("Track your progress", style: TextStyle(color: Colors.white),),
              Text("3 active goals", style: TextStyle(color: Colors.white),),
              DreamVacation()
            ],
          ),
        ),
      ),
    );
  }
}
