import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/pages/transfer_money.dart';

class QuickWalletTransfer extends StatefulWidget {
  const QuickWalletTransfer({super.key});

  @override
  State<QuickWalletTransfer> createState() => _QuickWalletTransferState();
}

class _QuickWalletTransferState extends State<QuickWalletTransfer> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    final List<Map<String, String>> beneficiaries = [
      {"name": "Sarah Johnson", "number": "2234567890"},
      {"name": "Michael Chen", "number": "2234567891"},
      {"name": "Emma William", "number": "2234567892"},
      {"name": "David Brown", "number": "2234567893"},
      {"name": "Lisa Davies", "number": "2234567894"},
    ];
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Quick Transfer",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 15 : 19,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransferMoney()),
                  );
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: spacing),
          CarouselSlider(
            items: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransferMoney()),
                  );
                },
                child: Container(
                  width: screenHeight,
                  margin: isMobile
                      ? EdgeInsets.fromLTRB(0, 0, 4.0, 0)
                      : EdgeInsets.fromLTRB(0, 0, 6.5, 0),
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: isMobile
                      ? EdgeInsets.all(5.0)
                      : EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color.fromARGB(
                          255,
                          91,
                          129,
                          160,
                        ),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                      SizedBox(height: spacing),
                      Text(
                        "New Transfer",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: isMobile ? 12 : 16,
                        ),
                      ),
                      SizedBox(height: spacing),
                      Text(
                        "Send money to other DigiKolo users",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 9 : 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ...beneficiaries.map((item) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TransferMoney()),
                    );
                  },
                  child: Container(
                    margin: isMobile
                        ? EdgeInsets.symmetric(horizontal: 4.0)
                        : EdgeInsets.symmetric(horizontal: 6.5),
                    width: screenWidth,
                    padding: isMobile
                        ? EdgeInsets.symmetric(vertical: 7.0, horizontal: 12.0)
                        : EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey, width: 1.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color.fromARGB(
                            255,
                            127,
                            168,
                            202,
                          ),
                          child: Icon(
                            Icons.person_2_outlined,
                            color: const Color.fromARGB(255, 59, 112, 156),
                          ),
                        ),
                        SizedBox(height: spacing),
                        Text(
                          "${item["name"]}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 12 : 16,
                          ),
                        ),
                        SizedBox(height: spacing - 3.5),
                        Text(
                          "${item["number"]}",
                          style: TextStyle(fontSize: isMobile ? 9 : 13),
                        ),
                        SizedBox(height: spacing + 2),
                        CircleAvatar(
                          radius: isMobile ? 15 : 19,
                          backgroundColor: const Color.fromARGB(
                            255,
                            21,
                            101,
                            167,
                          ),
                          child: Icon(
                            Icons.send_outlined,
                            color: Colors.white,
                            size: isMobile ? 18 : 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
            options: CarouselOptions(
              height: isMobile ? screenHeight * 0.22 : screenHeight * 0.30,
              viewportFraction: isMobile ? 0.4 : 0.25,
              enableInfiniteScroll: false,
              padEnds: false,
            ),
          ),
        ],
      ),
    );
  }
}
