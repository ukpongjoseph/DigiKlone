import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_flutter/pages/landing_page.dart';
import 'package:second_flutter/pages/support.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
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
            child: IconButton(onPressed: (){
              showDialog(
                // barrierDismissible: false,
                context: context, builder: (BuildContext context){
                return CupertinoAlertDialog(
                  title: Text("Success"),
                  content: Text("Profile updated successfully!"),
                  actions: [TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LandingPage()));
                      }, 
                      child: Text("OK")
                    )
                  ],
                );
              });
            }, icon: Icon(Icons.save)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: spacing*2),
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: isMobile?35:40,
                          child: Image.asset("assets/images/avatar.png",),
                        ),
                        CircleAvatar(
                          radius: isMobile?14:16,
                          child: IconButton(
                            onPressed: (){}, 
                            icon: Icon(Icons.camera_alt_outlined, size: isMobile?14:16,)
                          )
                        )
                      ],
                    ),
                    Text("Tap to change photo", style: TextStyle(fontSize: 10),)
                  ],
                ),
              ),
              SizedBox(height: spacing*3,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: spacing*2),
                child: Text("My profile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile?16:18),),
              ),
              readOnlyWidget("First Name", "John"),
              readOnlyWidget("Last Name", "Doe"),
              readOnlyWidget("Email Address", "john.doe@example.com"),
              readOnlyWidget("Phone Number", "+234 808 123 4567"),
              Row(
                children: [
                  Text("To change your account details, please ", style: TextStyle(fontSize: isMobile?10:12
                  ),),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Support()));
                    },
                    child: Text("contact support", style: TextStyle(fontSize: isMobile?10:12,
                    decoration: TextDecoration.underline
                  ),)),
                ],
              )
            ],
          )
        ),
      ),
    );
  }
  Widget readOnlyWidget(String title, String controller){
     double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: spacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: isMobile?12:14),),
          SizedBox(height: spacing,),
          TextFormField(
            readOnly: true,
            decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: isMobile?13:15),
              hintText: controller,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                gapPadding: 2.0
              )
            ),
          )
        ],
      ),
    );
  }
}