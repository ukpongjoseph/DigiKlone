import 'package:flutter/material.dart';

class TargetProgressCard extends StatefulWidget {
  final double screenWidth;
  final double spacing;
  final bool isMobile;
  const TargetProgressCard({
    super.key,
    required this.isMobile,
    required this.screenWidth,
    required this.spacing,
  });

  @override
  State<TargetProgressCard> createState() => _TargetProgressCardState();
}

class _TargetProgressCardState extends State<TargetProgressCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(widget.spacing * 2),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1.5, color: Colors.grey),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("₦325,000", style: TextStyle(fontWeight: FontWeight.bold, fontSize: widget.isMobile?16:18),), 
                  Text("of ₦800,000", style: TextStyle(fontSize: widget.isMobile?10:12, color: Colors.grey.shade600),)
                ]
              ),
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 216, 233, 246),
                child: Icon(Icons.track_changes_rounded, size: widget.isMobile?25:35, color: Colors.blue,)
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: widget.spacing*2),
            child: LinearProgressIndicator(
              value: 0.41,
              backgroundColor: Colors.blue.shade100,
              color: Colors.blue.shade800,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "₦475,000",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: widget.isMobile ? 13 : 15,
                    ),
                  ),
                  Text(
                    "Remaining",
                    style: TextStyle(
                      fontSize: widget.isMobile ? 10 : 12,
                    ),
                  ),
                ],
              ),
              SizedBox(width: widget.spacing * 4),
              Column(
                children: [
                  Text(
                    "₦45,000",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: widget.isMobile ? 13 : 15,
                    ),
                  ),
                  Text(
                    "Monthly Target",
                    style: TextStyle(
                      fontSize: widget.isMobile ? 10 : 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
