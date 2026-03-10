import 'package:flutter/material.dart';

class SingleContentSingleButtonModal extends StatefulWidget {
  final String titleMessage;
  final String contentMessage;
  final String buttonText;
  final bool isMobile;
  final double spacing;
  final double screenWidth;
  const SingleContentSingleButtonModal({super.key, required this.buttonText, required this.contentMessage, required this.titleMessage,required this.isMobile,
    required this.screenWidth,
    required this.spacing,});

  @override
  State<SingleContentSingleButtonModal> createState() => _SingleContentSingleButtonModalState();
}

class _SingleContentSingleButtonModalState extends State<SingleContentSingleButtonModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.titleMessage, style: TextStyle(fontWeight: FontWeight.bold, fontSize: widget.isMobile?13:15),),
      content: Text(widget.contentMessage, style: TextStyle(fontSize: widget.isMobile?11:13),),
      actions: [
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12)
              )
            ),
            onPressed: (){
              Navigator.pop(context);
            }, 
            child: Text(widget.buttonText, style: TextStyle(fontWeight: FontWeight.w700, fontSize: widget.isMobile?12:14, color: Colors.grey.shade700),)
          ),
        )
      ],
    );
  }
}