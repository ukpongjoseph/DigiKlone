import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/pages/sign_in.dart';
import 'package:second_flutter/pages/signup/firstname.dart';
// import 'package:second_flutter/pages/sign_up.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: theme.colorScheme.primary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          "My flutter app",
          style: TextStyle(
            color: theme.colorScheme.surface,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "D",
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: 150.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Save Smarter with",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isMobile ? 25 : 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Digikolo",
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: isMobile ? 25 : 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your digital",
                      style: TextStyle(
                        fontSize: isMobile ? 25 : 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      "savings",
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: isMobile ? 25 : 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  "partner",
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: isMobile ? 25 : 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 25.0),
                Text("Choose from three savings products:"),
                Text("Regular, Target, or Fixed savings."),
                Text("Start your financial journey today."),
                SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          color: theme.colorScheme.primary,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 25 : 40.0,
                          vertical: isMobile ? 15 : 20,
                        ),
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 30.0),
                    FilledButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Firstname()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 25 : 40.0,
                          vertical: isMobile ? 15 : 20,
                        ),
                        backgroundColor: theme.colorScheme.primary,
                      ),
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
