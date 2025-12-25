import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/nav_provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
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
  late List<Map<String, dynamic>> carouselItems;

  @override
  void initState() {
    super.initState();
    carouselItems = [
      {
        "title": "Set a Target",
        "icon": Icons.track_changes,
        "action": () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DigiTargetSavings()),
        ),
        "color": Colors.blue,
      },
      {
        "title": "Lock Funds",
        "icon": Icons.lock_outlined,
        "action": () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LockFunds()),
        ),
        "color": Colors.pink,
      },
      {
        "title": "Refer Friends",
        "icon": Icons.card_giftcard_sharp,
        "action": () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReferFriends()),
        ),
        "color": Colors.green,
      },
      {
        "title": "Security",
        "icon": Icons.shield_outlined,
        "action": () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Security()),
        ),
        "color": Colors.pink,
      },
      {
        "title": "Add Card",
        "icon": Icons.credit_card,
        "action": () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddCard()),
        ),
        "color": Colors.purple,
      },
      {
        "title": "Support",
        "icon": Icons.chat_bubble_outline_outlined,
        "action": () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Support()),
        ),
        "color": Colors.green,
      },
      {
        "title": "FAQ",
        "icon": Icons.question_answer_outlined,
        "action": () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Faq()),
        ),
        "color": Colors.lime,
      },
      {
        "title": "Add Funds",
        "icon": Icons.add,
        "action": () => context.read<NavProvider>().setCurrentPage(2),
        "color": Colors.purpleAccent,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 3 : 5;
    double viewport;
    if (screenWidth > 600) {
      viewport = 0.25;
    } else {
      viewport = 0.3;
    }
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    return PopScope(
      canPop: false,
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Quick Actions",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0),
              ),
            ),
            CarouselSlider(
              items: carouselItems.map((e) {
                return GestureDetector(
                  onTap: e["action"],
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: isMobile
                        ? EdgeInsets.all(3.0)
                        : EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: isMobile
                        ? EdgeInsets.all(7.0)
                        : EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: e["color"],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            e["icon"],
                            size: screenWidth > 600 ? 35 : 25,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: spacing),
                        Text(
                          e["title"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth > 600 ? 14.0 : 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: screenWidth > 600
                    ? screenHeight * 0.20
                    : screenHeight * 0.15,
                viewportFraction: viewport,
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
