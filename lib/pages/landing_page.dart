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
      body: _pages[currentPageIndex],
      bottomNavigationBar: BottomNav(),
    );
  }
}
