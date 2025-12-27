import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/nav_provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    int currentPageIndex = Provider.of<NavProvider>(
      context,
      listen: true,
    ).getCurrentPage();
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    return NavigationBar(
      shadowColor: Colors.grey[900],
      elevation: 50.0,
      backgroundColor: theme.colorScheme.surfaceContainerHighest,
      indicatorColor: Colors.transparent,
      onDestinationSelected: (int value) {
        Provider.of<NavProvider>(context, listen: false).setCurrentPage(value);
      },
      selectedIndex: currentPageIndex,
      destinations: [
        customNav(0, "Home", Icons.home),
        customNav(1, "Savings", Icons.savings),
        customNav(2, "Wallet", Icons.wallet),
        customNav(3, "Activity", Icons.bar_chart_sharp),
        customNav(4, "Me", Icons.person),
      ],
    );
  }

  Widget customNav(int index, String navLabel, IconData navIcon) {
    int currentPageIndex = Provider.of<NavProvider>(
      context,
      listen: true,
    ).getCurrentPage();
    return NavigationDestination(
      icon: Icon(
        navIcon,
        color: index == currentPageIndex ? Colors.blue[400] : Colors.grey[400],
      ),
      label: navLabel,
    );
  }
}
