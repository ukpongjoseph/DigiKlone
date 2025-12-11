import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/nav_provider.dart';
import 'package:second_flutter/components/balance_component.dart';
import 'package:second_flutter/components/digi_savings.dart';
import 'package:second_flutter/components/quick_actions.dart';
import 'package:second_flutter/components/quick_transfer.dart';

class LandingHome extends StatefulWidget {
  const LandingHome({super.key});

  @override
  State<LandingHome> createState() => _LandingHomeState();
}

class _LandingHomeState extends State<LandingHome> {
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                context.read<NavProvider>().setCurrentPage(4);
              },
              child: CircleAvatar(
                child: Image.asset("assets/images/avatar.png"),
              ),
            ),
            SizedBox(width: 10.0),
            date.hour < 12
                ? Text(
                    "Good Morning, User",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : (date.hour > 12 && date.hour < 18)
                ? Text(
                    "Good Afternoon, User",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Text(
                    "Good Evening, User",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            SizedBox(width: 10.0),
            date.hour < 12
                ? Icon(Icons.sunny, color: Colors.amber[600])
                : (date.hour > 12 && date.hour < 18)
                ? Icon(Icons.wb_sunny, color: Colors.amber[600])
                : Icon(Icons.mode_night_rounded, color: Colors.grey[600]),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80.0),
                color: const Color.fromARGB(255, 201, 224, 235),
              ),
              child: IconButton(
                icon: Icon(Icons.notifications_none),
                onPressed: () {},
              ),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 246, 248, 248),
          child: Column(
            children: [
              BalanceComponent(),
              QuickActions(),
              DigiSavings(),
              QuickTransfer(),
            ],
          ),
        ),
      ),
    );
  }
}
