import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:provider/provider.dart';
import 'package:second_flutter/Navigation/bottom_nav.dart';
// ignore: unused_import
import 'package:second_flutter/a_List_providers/auth_login_provider.dart';
import 'package:second_flutter/a_List_providers/nav_provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // final _pages = Provider.of<NavProvider>(context, listen: false).getPages();
  // int currentPageIndex = Provider.of<NavProvider>(context, listen: true).getCurrentPage();
  late List _pages;
  late int currentPageIndex;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pages = context.read<NavProvider>().getPages();
  }

  @override
  Widget build(BuildContext context) {
    currentPageIndex = context.watch<NavProvider>().getCurrentPage();
    return Scaffold(
      appBar: currentPageIndex != 0
          ? null
          : AppBar(
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
                  Text(
                    "Welcome User",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Icon(Icons.emoji_emotions_rounded, color: Colors.amber[600]),
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
      body: _pages[currentPageIndex],
      bottomNavigationBar: BottomNav(),
    );
  }
}
