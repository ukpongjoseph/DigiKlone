import 'package:flutter/material.dart';

class DreamVacationContainer extends StatefulWidget {
  final double spacing;
  final double screenWidth;
  final bool isMobile;
  const DreamVacationContainer({super.key, required this.isMobile, required this.screenWidth, required this.spacing});

  @override
  State<DreamVacationContainer> createState() => _DreamVacationContainerState();
}

class _DreamVacationContainerState extends State<DreamVacationContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(widget.spacing*2),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue.shade900,
      ),
      child: Column(
        children: [
          Text("Current Balance", style: TextStyle(color: Colors.blue.shade200),),
          Text("₦325,000", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: widget.isMobile?20:22),),
          Container(
            padding: EdgeInsets.all(widget.spacing),
            margin: EdgeInsetsDirectional.symmetric(vertical: widget.spacing*2),
            width: widget.screenWidth*0.45,
            decoration: BoxDecoration(
              color: Colors.blue.shade300,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.trending_up, color: Colors.green,),
                    Text("Interest Accured", style: TextStyle(color: Colors.grey.shade300, fontSize: widget.isMobile?10:12),)
                  ],
                ),
                Text("+₦12,500", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: widget.isMobile?13:15),),
                Text("12% p.a.", style: TextStyle(color: Colors.grey.shade300, fontSize: widget.isMobile?10:12),)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [
                Text("41%", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: widget.isMobile?13:15),),
                Text("progress", style: TextStyle(color: Colors.grey.shade300, fontSize: widget.isMobile?10:12),),
              ],),
              SizedBox(width: widget.spacing*4,),
              Column(children: [
                Text("dec 31, 2024", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: widget.isMobile?13:15),),
                Text("Target Date", style: TextStyle(color: Colors.grey.shade300, fontSize: widget.isMobile?10:12),)
              ],)
            ],
          )
        ],
      ),
    );
  }
}