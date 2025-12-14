import 'package:flutter/material.dart';
import 'package:second_flutter/pages/digi_lock.dart';
import 'package:second_flutter/pages/digi_save_balance.dart';
import 'package:second_flutter/pages/digi_target.dart';

class DigiSavings extends StatefulWidget {
  const DigiSavings({super.key});

  @override
  State<DigiSavings> createState() => _DigiSavingsState();
}

class _DigiSavingsState extends State<DigiSavings> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 3.0 : 8.0;
    void showDigiTribeDialogueBox() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(12.0),
            content: SizedBox(
              child: Column(
                // making the dialog box responsive
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Coming Soon",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: isMobile ? 14 : 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.close),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 218, 79, 246),
                    child: Icon(Icons.people_alt_outlined, color: Colors.white),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "We are working hard to bring you this amazing feature. Stay tuned for updates!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: isMobile ? 10 : 12,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          218,
                          79,
                          246,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        "Got it",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your Savings",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17.0),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 181, 219, 249),
                  ),
                  label: Text(
                    "View all",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: isMobile ? 12 : 14,
                    ),
                  ),
                  icon: Icon(
                    Icons.visibility_outlined,
                    size: isMobile ? 15 : 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.0),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DigiSaveBalance()),
              );
            },
            child: Container(
              padding: isMobile ? EdgeInsets.all(10.0) : EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Icon(
                          Icons.savings_outlined,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: spacing),
                      Text(
                        "DigiSave",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: isMobile ? 16 : 18,
                        ),
                      ),
                      SizedBox(height: spacing),
                      Text(
                        "Save on the go!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 12 : 14,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DigiSaveBalance(),
                        ),
                      );
                    },
                    label: Text(
                      "18.5% p.a.",
                      style: TextStyle(
                        fontSize: isMobile ? 10 : 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    icon: Icon(Icons.trending_up_sharp, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DigiTarget()),
                  );
                },
                child: Container(
                  width: screenWidth * 0.3,
                  padding: isMobile
                      ? EdgeInsets.all(7.0)
                      : EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 15, 159, 89),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color.fromARGB(
                          255,
                          26,
                          244,
                          138,
                        ),
                        child: Icon(
                          Icons.track_changes,
                          size: isMobile ? 25 : 35,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: spacing + 2.0),
                      Text(
                        "DigiTarget",
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: spacing),
                      Row(
                        children: [
                          Icon(
                            Icons.adjust_outlined,
                            size: isMobile ? 15 : 25,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            "18.5% p.a.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isMobile ? 12 : 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: spacing + 3),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DigiLock()),
                  );
                },
                child: Container(
                  width: screenWidth * 0.3,
                  padding: isMobile
                      ? EdgeInsets.all(7.0)
                      : EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 99, 4, 4),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 241, 13, 13),
                        child: Icon(
                          Icons.shield_outlined,
                          size: isMobile ? 25 : 35,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: spacing + 2.0),
                      Text(
                        "DigiLock",
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: spacing),
                      Row(
                        children: [
                          Icon(
                            Icons.adjust_outlined,
                            size: isMobile ? 15 : 25,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            "21% p.a.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isMobile ? 12 : 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: spacing + 3),
              GestureDetector(
                onTap: () {
                  showDigiTribeDialogueBox();
                },
                child: Container(
                  width: screenWidth * 0.3,
                  padding: isMobile
                      ? EdgeInsets.all(7.0)
                      : EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 115, 7, 132),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color.fromARGB(
                          255,
                          214,
                          14,
                          245,
                        ),
                        child: Icon(
                          Icons.people_outlined,
                          size: isMobile ? 25 : 35,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: spacing + 2.0),
                      Text(
                        "DigiTribe",
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: spacing),
                      Row(
                        children: [
                          Icon(
                            Icons.adjust_outlined,
                            size: isMobile ? 15 : 25,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            "18.5% p.a.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isMobile ? 12 : 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
