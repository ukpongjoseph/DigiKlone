import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class QuickActions extends StatefulWidget {
  const QuickActions({super.key});

  @override
  State<QuickActions> createState() => _QuickActionsState();
}

class _QuickActionsState extends State<QuickActions> {
  final List<Map<String, dynamic>> carouselItems = [
    {"title": "Set a Target", "icon": Icon(Icons.track_changes)},
    {"title": "Lock Funds", "icon": Icon(Icons.lock_outlined)},
    {"title": "Refer Friends", "icon": Icon(Icons.card_giftcard_sharp)},
    {"title": "Security", "icon": Icon(Icons.shield_outlined)},
    {"title": "Add Card", "icon": Icon(Icons.credit_card)},
    {"title": "Support", "icon": Icon(Icons.chat_bubble_outline_outlined)},
    {"title": "FAQ", "icon": Icon(Icons.question_answer_outlined)},
    {"title": "Add Funds", "icon": Icon(Icons.add)},
  ];
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text("Quick Actions"),
            ),
            CarouselSlider(
              items: carouselItems.map((e) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      e["icon"],
                      SizedBox(height: 5.0),
                      Text(e["title"]),
                    ],
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 80.0,
                viewportFraction: 0.25,
                enlargeCenterPage: false,
                padEnds: false,
                enableInfiniteScroll: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
