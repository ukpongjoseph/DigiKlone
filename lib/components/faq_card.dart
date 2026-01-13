import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/theme/app_theme.dart';

class FaqCard extends StatelessWidget {
  final TextEditingController controller;
  final Function onSearch;
  const FaqCard({
    super.key, 
    required this.controller,
    required this.onSearch 
    });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(spacing),
            child: Form(
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      onSearch(value);
                    },
                    style: TextStyle(
                      fontSize: isMobile ? 10:12
                    ),
                    controller: controller,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: spacing),
                      prefixIcon: Icon(Icons.search, size: 25,),
                      hint: Text("search frequently asked questions", style: TextStyle(fontSize: isMobile ? 12 : 14, color: theme.colorScheme.onSurface),),
                       border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                    onSubmitted: (value) {
                      onSearch(value);
                    },
                  )
                ],
              )
            ),
          ),
          SizedBox(height: spacing),
          CircleAvatar(
            radius: 25,
            backgroundColor:  theme == lightTheme
                ? Colors.purple.shade100
                : theme.colorScheme.surfaceContainerHighest,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1.5,
                  color: theme.colorScheme.secondary
                )
              ),
              child: Icon(Icons.question_mark_outlined, color: theme.colorScheme.secondary)),
          ),
          SizedBox(height: spacing),
          Text("How can we help you",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 18 : 22,
            ),),
          Text("Find answers to commonly asked questions about digikolo",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: isMobile ? 12 : 14),)
        ],
      ),
    );
  }
}