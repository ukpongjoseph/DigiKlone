import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';

class SavedPaymentMethods extends StatefulWidget {
  const SavedPaymentMethods({super.key});

  @override
  State<SavedPaymentMethods> createState() => _SavedPaymentMethodsState();
}

class _SavedPaymentMethodsState extends State<SavedPaymentMethods> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Saved Payment Methods", 
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.bold, 
          fontSize: isMobile ? 14 : 16
          ),
        ),
        SizedBox(height: spacing * 2,),
        Container(
          padding: isMobile ? EdgeInsets.all(8) : EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: theme.colorScheme.onSurface,
            borderRadius: BorderRadius.circular(10), 
            border: Border.all(
              width: 1.5, 
              color: theme.colorScheme.onSurface
            )
        ), 
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Visa", 
                style: TextStyle(
                  color: Colors.white
                ),),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    minimumSize: Size.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(20)
                    )
                  ),
                  onPressed: (){}, 
                  child: Text("Default", style: TextStyle(color: Colors.white, fontSize: isMobile ? 9 : 11),)
                )
              ],
            )
          ],
        ),
      )
      ],
    );
  }
}