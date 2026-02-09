import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Profile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: spacing),
            child: Icon(Icons.save),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          
          child: Column(
            children: [
        
            ],
          )
        ),
      ),
    );
  }
}