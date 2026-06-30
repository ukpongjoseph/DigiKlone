import 'package:flutter/material.dart';
import 'package:second_flutter/componentBuilder/dream_vacation_deposit_modalsheet.dart';
import 'package:second_flutter/componentBuilder/dream_vacation_withdraw_bottom_sheet.dart';

class DreamVacationActions extends StatefulWidget {
  final double screenWidth;
  final double spacing;
  final bool isMobile;
  const DreamVacationActions({super.key, required this.isMobile, required this.screenWidth, required this.spacing});

  @override
  State<DreamVacationActions> createState() => _DreamVacationActionsState();
}

class _DreamVacationActionsState extends State<DreamVacationActions> {
  void displayWithdrawBottomSheet(){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, builder: (BuildContext context){
      return DreamVacationWithdrawBottomSheet();
    });
  }
  void displayDepositBottomSheet(){
        showModalBottomSheet(
      isScrollControlled: true,
      context: context, builder: (BuildContext context){
      return DreamVacationDepositModalsheet();
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10)
                )
              ),
              onPressed: (){
                displayDepositBottomSheet();
              }, child: Text("+ Add Money", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))),
          SizedBox(width: widget.spacing * 2,),
          Expanded(child: ElevatedButton( style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10)
                )
              ),onPressed: (){
                displayWithdrawBottomSheet();
              }, child: Text("- Withdraw", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),))),
        ],
      ),
    );
  }
}
