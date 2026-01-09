// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:second_flutter/a_List_providers/theme_provider.dart';

// class CustomSecuritySettingsWithIconButton extends StatefulWidget {
//   const CustomSecuritySettingsWithIconButton({super.key});

//   @override
//   State<CustomSecuritySettingsWithIconButton> createState() => _CustomSecuritySettingsWithIconButtonState();
// }

// class _CustomSecuritySettingsWithIconButtonState extends State<CustomSecuritySettingsWithIconButton> {
//   @override
//   Widget build(BuildContext context,  IconData icon,
//     String title,
//     String subtitle,
//     String dialogSubtitleText,
//     String buttontext,) {
//     ThemeData theme = context.read<ThemeProvider>().getTheme();
//     double screenWidth = MediaQuery.of(context).size.width;
//     bool isMobile = screenWidth < 600;
//     double spacing = isMobile ? 5 : 8;
//       return Container(
//       padding: isMobile ? EdgeInsets.all(2) : EdgeInsets.all(4),
//       child: ListTile(
//         leading: CircleAvatar(child: Icon(icon)),
//         title: Text(title),
//         subtitle: Text(subtitle),
//         trailing: IconButton(
//           onPressed: () {
//             displayDialog(title, dialogSubtitleText, buttontext);
//           },
//           icon: Icon(Icons.chevron_right_rounded),
//         ),
//       ),
//     );
//   }
// }