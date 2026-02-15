import 'package:flutter/material.dart';
import 'package:second_flutter/pages/all_message_page.dart';
import 'package:second_flutter/pages/promotion_messages_page.dart';
import 'package:second_flutter/pages/update_messages_page.dart';

class MessageCenter extends StatefulWidget {
  const MessageCenter({super.key});

  @override
  State<MessageCenter> createState() => _MessageCenterState();
}

class _MessageCenterState extends State<MessageCenter>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {
        currentIndex = tabController.index;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Scaffold(
      appBar: AppBar(
        title: Text("Message Center"),
        centerTitle: true,
        bottom: TabBar(
          padding: EdgeInsets.zero,
          indicatorColor: Colors.transparent,
          indicator: BoxDecoration(),
          controller: tabController,
          dividerColor: Colors.transparent,
          tabs: [
            customBar("All", 0),
            customBar("Promotions", 1),
            customBar("Updates", 2),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          
        ),
        child: TabBarView(
          controller: tabController,
          children: [
            AllMessagePage(
              screenWith: screenWidth,
              spacing: spacing,
              isMobile: isMobile,
            ),
            PromotionMessagesPage(screenWith: screenWidth,
              spacing: spacing,
              isMobile: isMobile,),
            UpdateMessagesPage(screenWith: screenWidth,
              spacing: spacing,
              isMobile: isMobile,),
          ],
        ),
      ),
    );
  }

  Widget customBar(String title, int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    bool isSelected = currentIndex == index;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: spacing),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isSelected ? Colors.blue : null,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isSelected ? Colors.white : null,
          fontSize: isMobile ? 12 : 14,
        ),
      ),
    );
  }
}
