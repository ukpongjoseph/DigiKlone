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
  List<Map<String, dynamic>> messages = [
    {
      "time" : "2 hours ago",
      "redirection" : "Learn More",
      "isTitleIconPresent" : true,
      "leadingIcon" : Icons.trending_up_sharp,
      "title" : "Limited Time: 20% APY on DigiLock",
      "activity_type" : "savings",
      "titleIcon" : Icons.celebration_outlined,
      "subtitle" : "Lock your fund for 6 months and earn our highest rate ever. Ends December 31st",
      "isPromotion" : true,
      "isUpdates" : false,
      "stacked" : true,
      "avatarColor" : const Color.fromARGB(255, 214, 203, 239),
      "iconColor" : const Color.fromARGB(255, 127, 68, 255)
    },
    {
      "time" : "5 hours ago",
      "redirection" : "Add Funds",
      "isTitleIconPresent" : false,
      "leadingIcon" : Icons.track_changes,
      "title" : "Your DigiTarget Goal is 80% Complete",
      "activity_type" : "Goals",
      "subtitle" : "You're almost there! Only ₦45,000 away from your ₦250,000 goal",
      "isPromotion" : false,
      "isUpdates" : true,
      "stacked" : true,
      "avatarColor" : const Color.fromARGB(255, 123, 180, 125),
      "iconColor" : const Color.fromARGB(255, 54, 149, 40)
    },
    {
      "time" : "1 day ago",
      "redirection" : "Set Up Now",
      "isTitleIconPresent" : true,
      "leadingIcon" : Icons.star_border_purple500_rounded,
      "title" : "New Feature: Auto-Save is Here",
      "activity_type" : "Features",
      "titleIcon" : Icons.star_rate_rounded,
      "subtitle" : "You're almost there! Only ₦45,000 away from your ₦250,000 goal",
      "isPromotion" : true,
      "isUpdates" : false,
      "stacked" : false,
      "avatarColor" : const Color.fromARGB(255, 207, 210, 156),
      "iconColor" : const Color.fromARGB(255, 244, 251, 52)
    },
    {
      "time" : "2 day ago",
      "redirection" : "View Details",
      "isTitleIconPresent" : false,
      "leadingIcon" : Icons.notification_add_outlined,
      "title" : "Monthly Interest Credited",
      "activity_type" : "Account",
      "subtitle" : "₦12,450 interest has been aded to your DigiSave accont",
      "isPromotion" : false,
      "isUpdates" : true,
      "stacked" : false,
     "avatarColor" : const Color.fromARGB(255, 214, 203, 239),
      "iconColor" : const Color.fromARGB(255, 127, 68, 255)
    },
    {
      "time" : "3 day ago",
      "redirection" : "Invite Now",
      "isTitleIconPresent" : true,
      "titleIcon" : Icons.wallet_giftcard,
      "leadingIcon" : Icons.wallet_giftcard_outlined,
      "title" : "Refer Friends, Earn ₦5,000",
      "activity_type" : "Account",
      "subtitle" : "For every friend you refer who completes KYC, you both get ₦5,000 bonus",
      "isPromotion" : true,
      "isUpdates" : false,
      "stacked" : false,
     "avatarColor" : const Color.fromARGB(255, 239, 203, 219),
      "iconColor" : const Color.fromARGB(255, 255, 68, 115)
    },
    {
      "time" : "4 day ago",
      "redirection" : "Review",
      "isTitleIconPresent" : false,
      "leadingIcon" : Icons.notification_add_outlined,
      "title" : "Security Alert: New Device Login",
      "activity_type" : "Secuirty",
      "subtitle" : "Your account was accessed from a new device on iPhone 15 Pro",
      "isPromotion" : false,
      "isUpdates" : true,
      "stacked" : false,
     "avatarColor" : const Color.fromARGB(255, 239, 203, 219),
      "iconColor" : const Color.fromARGB(255, 255, 68, 115)
    },
  ];
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
        // elevation: 10.0,
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
          width: double.infinity,
          padding: EdgeInsets.all(spacing),
          decoration: BoxDecoration(
          ),
            child: TabBarView(
              controller: tabController,
              children: [
                AllMessagePage(
                  screenWith: screenWidth,
                  spacing: spacing,
                  isMobile: isMobile,
                  messages: messages,
                ),
                PromotionMessagesPage(screenWith: screenWidth,
                  spacing: spacing,
                  isMobile: isMobile,
                  messages: messages,),
                UpdateMessagesPage(screenWith: screenWidth,
                  spacing: spacing,
                  isMobile: isMobile,
                  messages: messages,),
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
