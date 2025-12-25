import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/pages/sign_in.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = context.read<ThemeProvider>().getTheme();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Profile"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child: CircleAvatar(
              backgroundColor: themeData.colorScheme.surface,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
                icon: Icon(Icons.logout_rounded, color: Colors.red),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(children: [Text("Profile Page")]),
        ),
      ),
    );
  }
}
