import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/theme/app_theme.dart';

class FaqCard extends StatefulWidget {
  const FaqCard({super.key});

  @override
  State<FaqCard> createState() => _FaqCardState();
}

class _FaqCardState extends State<FaqCard> {
  final _formKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();
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
              key: _formKey,
              child: Column(
                children: [
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      // prefixIconConstraints: BoxConstraints(),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: spacing),
                      prefixIcon: Icon(Icons.search, size: 25,),
                      hint: Text("search frequently asked questions", style: TextStyle(fontSize: isMobile ? 12 : 14, color: theme.colorScheme.onSurface),),
                       border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
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