import 'package:flutter/material.dart';

class AutoSaveSettingsPage extends StatefulWidget {
  const AutoSaveSettingsPage({super.key});

  @override
  State<AutoSaveSettingsPage> createState() => _AutoSaveSettingsPageState();
}

class _AutoSaveSettingsPageState extends State<AutoSaveSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("Auto save settings page")),
    );
  }
}
