import 'package:flutter/material.dart';


class LockContainer extends StatefulWidget {
  const LockContainer({super.key});

  @override
  State<LockContainer> createState() => _LockContainerState();
}

class _LockContainerState extends State<LockContainer> {
  void displayBottomSheet(){
    showModalBottomSheet(
      isDismissible: false,
      context: context, builder: (BuildContext context){
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Container(
          margin: EdgeInsets.zero,
          width: double.infinity,
          height:  MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            color: Colors.transparent
          ),
          child: Text("Close"),
        )),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Container(
      // margin: isMobile ? EdgeInsets.all(10) : EdgeInsets.all(12),
      padding: EdgeInsets.symmetric(vertical: isMobile ? 10 : 14),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: Colors.pink.shade800
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.pink[800]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: spacing * 5,),
              CircleAvatar(
                backgroundColor: Colors.pink[400],
                child: Icon(Icons.shield_outlined),
              ),
            IconButton(onPressed: (){
              displayBottomSheet();
            }, icon: Icon(Icons.info_outline, size: isMobile ? 20 : 30,)),
            ],
          ),
          SizedBox(height: spacing,),
          Text("Lock in higher returns", style: TextStyle(fontSize: isMobile ? 12 : 14),),
          SizedBox(height: spacing,),
          Text("₦850,000", style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 22 : 25),),
          SizedBox(height: spacing,),
          Text("Total Invested", style: TextStyle(fontSize: isMobile ? 12 : 14)),
          SizedBox(height: spacing * 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("₦311,870", style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 13 : 15),),
                  SizedBox(height: spacing/2,),
                  Text("Projected Returns", style: TextStyle(fontSize: isMobile ? 10 : 12))
                ],
              ),
              SizedBox(width: spacing *3,),
                Column(
                children: [
                  Text("17.8%", style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 13 : 15),),
                  SizedBox(height: spacing/2,),
                  Text("Avg Rate", style: TextStyle(fontSize: isMobile ? 10 : 12))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}