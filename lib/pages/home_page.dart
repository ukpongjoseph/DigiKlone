import 'package:flutter/material.dart';
import 'package:second_flutter/pages/sign_in.dart';
import 'package:second_flutter/pages/signup/firstname.dart';
// import 'package:second_flutter/pages/sign_up.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return SingleChildScrollView(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 194, 212, 221),
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Colors.lightBlueAccent,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(
            "My flutter app",
            style: TextStyle(
              color: Colors.white,
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
                      color: const Color.fromARGB(255, 3, 63, 132),
                      fontSize: 150.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "Save Smarter with",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 25 : 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Digikolo",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 3, 30, 112),
                      fontSize: isMobile ? 25 : 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your gigital",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 25 : 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "savings",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 3, 30, 112),
                          fontSize: isMobile ? 25 : 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "partner",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 3, 30, 112),
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
                            color: const Color.fromARGB(255, 1, 10, 55),
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
                            color: const Color.fromARGB(255, 4, 1, 80),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 30.0),
                      FilledButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Firstname(),
                            ),
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
                          backgroundColor: const Color.fromARGB(255, 0, 6, 70),
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
        // bottomNavigationBar: NavigationBar(
        //   backgroundColor: const Color.fromARGB(255, 194, 212, 221),
        //   destinations: [
        //     NavigationDestination(
        //       icon: Icon(Icons.home),
        //       label: "Home"
        //     ),
        //     NavigationDestination(
        //       icon: Icon(Icons.login),
        //       label: "Home"
        //     ),
        //   ]
        // )
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
