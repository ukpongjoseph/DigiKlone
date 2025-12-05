import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/nav_provider.dart';
import 'package:second_flutter/pages/add_card.dart';
import 'package:second_flutter/pages/digi_target_savings.dart';
import 'package:second_flutter/pages/faq.dart';
import 'package:second_flutter/pages/lock_funds.dart';
import 'package:second_flutter/pages/refer_friends.dart';
import 'package:second_flutter/pages/security.dart';
import 'package:second_flutter/pages/support.dart';

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
              items: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DigiTargetSavings(),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        carouselItems[0]["icon"],
                        SizedBox(height: 5.0),
                        Text(carouselItems[0]["title"]),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LockFunds()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        carouselItems[1]["icon"],
                        SizedBox(height: 5.0),
                        Text(carouselItems[1]["title"]),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReferFriends()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        carouselItems[2]["icon"],
                        SizedBox(height: 5.0),
                        Text(carouselItems[2]["title"]),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Security()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        carouselItems[3]["icon"],
                        SizedBox(height: 5.0),
                        Text(carouselItems[3]["title"]),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddCard()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        carouselItems[4]["icon"],
                        SizedBox(height: 5.0),
                        Text(carouselItems[4]["title"]),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Support()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        carouselItems[5]["icon"],
                        SizedBox(height: 5.0),
                        Text(carouselItems[5]["title"]),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Faq()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        carouselItems[6]["icon"],
                        SizedBox(height: 5.0),
                        Text(carouselItems[6]["title"]),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<NavProvider>().setCurrentPage(2);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        carouselItems[7]["icon"],
                        SizedBox(height: 5.0),
                        Text(carouselItems[7]["title"]),
                      ],
                    ),
                  ),
                ),
              ],
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
