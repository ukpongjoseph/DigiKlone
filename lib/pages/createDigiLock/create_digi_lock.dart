import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';

class CreateDigiLock extends StatefulWidget {
  const CreateDigiLock({super.key});

  @override
  State<CreateDigiLock> createState() => _CreateDigiLockState();
}

class _CreateDigiLockState extends State<CreateDigiLock> {
  final daysController = TextEditingController();
  bool displayCard = false;
  int rateValue = 0;
  Widget one = Container(
    margin: EdgeInsets.only(bottom: 20),
    padding: EdgeInsets.all(7),
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
      dense: true,
      minLeadingWidth: 0,
      minTileHeight: 0,
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.all(0),
      horizontalTitleGap: 5,
      leading: Icon(Icons.watch_later_outlined, color: Colors.white),
      title: Text("10-30 days", style: TextStyle(color: Colors.white)),
      trailing: Text("14.5% p.a", style: TextStyle(color: Colors.white)),
    ),
  );
  Widget two = Container(
    margin: EdgeInsets.only(bottom: 20),
    padding: EdgeInsets.all(7),
    decoration: BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
      dense: true,
      minLeadingWidth: 0,
      minTileHeight: 0,
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.all(0),
      horizontalTitleGap: 5,
      leading: Icon(Icons.watch_later_outlined, color: Colors.white),
      title: Text("31-60 days", style: TextStyle(color: Colors.white)),
      trailing: Text("14.5% p.a", style: TextStyle(color: Colors.white)),
    ),
  );
  Widget three = Container(
    margin: EdgeInsets.only(bottom: 20),
    padding: EdgeInsets.all(7),
    decoration: BoxDecoration(
      color: Colors.purple,
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
      dense: true,
      minLeadingWidth: 0,
      minTileHeight: 0,
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.all(0),
      horizontalTitleGap: 5,
      leading: Icon(Icons.watch_later_outlined, color: Colors.white),
      title: Text("61-90 days", style: TextStyle(color: Colors.white)),
      trailing: Text("14.5% p.a", style: TextStyle(color: Colors.white)),
    ),
  );
  Widget four = Container(
    margin: EdgeInsets.only(bottom: 20),
    padding: EdgeInsets.all(7),
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
      dense: true,
      minLeadingWidth: 0,
      minTileHeight: 0,
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.all(0),
      horizontalTitleGap: 5,
      leading: Icon(Icons.watch_later_outlined, color: Colors.white),
      title: Text("91-180 days", style: TextStyle(color: Colors.white)),
      trailing: Text("14.5% p.a", style: TextStyle(color: Colors.white)),
    ),
  );
  Widget five = Container(
    margin: EdgeInsets.only(bottom: 20),
    padding: EdgeInsets.all(7),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
      dense: true,
      minLeadingWidth: 0,
      minTileHeight: 0,
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.all(0),
      horizontalTitleGap: 5,
      leading: Icon(Icons.watch_later_outlined, color: Colors.white),
      title: Text("181-365 days", style: TextStyle(color: Colors.white)),
      trailing: Text("14.5% p.a", style: TextStyle(color: Colors.white)),
    ),
  );

  @override
  void initState() {
    super.initState();
    daysController.addListener(() {
      setState(() {
        displayCard =
            int.parse(daysController.text) >= 10 &&
            int.parse(daysController.text) <= 365;
        rateValue = int.parse(daysController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 600;
    double spacing = isMobile ? 5 : 8;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Number of Days",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 16 : 19,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(spacing * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: 0.2,
              color: Colors.pink,
              backgroundColor: Colors.grey,
            ),
            Center(
              child: Text(
                "Step 1 of 5",
                style: TextStyle(fontSize: isMobile ? 11 : 13),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacing * 5),
              child: Text(
                "Enter the amount of days you want to lock your funds",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: isMobile ? 12 : 14),
              ),
            ),
            Text(
              "Number of Days",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? 13 : 15,
              ),
            ),
            TextFormField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: daysController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "cannot return an empty value";
                } else if (int.parse(value) < 10 || int.parse(value) > 365) {
                  return "Days must be between 10-265 days";
                }
                return null;
              },
              decoration: InputDecoration(
                hint: Text(
                  "Enter days(10-365)",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: isMobile ? 11 : 13,
                  ),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            (rateValue >= 10 && rateValue <= 365)
                ? Text(
                    "Selected Tenure",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  )
                : Container(),
            SizedBox(height: 10),
            (rateValue >= 10 && rateValue <= 30)
                ? one
                : (rateValue >= 31 && rateValue <= 60)
                ? two
                : (rateValue >= 61 && rateValue <= 90)
                ? three
                : (rateValue >= 91 && rateValue <= 180)
                ? four
                : (rateValue >= 181 && rateValue <= 365)
                ? five
                : Container(),
            Text(
              "Available Rates",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? 11 : 13,
              ),
            ),
            SizedBox(height: spacing),
            rateTile("10-30 days", "14%p.a", Colors.red),
            rateTile("31-60 days", "14.5%p.a", Colors.orange),
            rateTile("61-90 days", "15.5%p.a", Colors.purple),
            rateTile("91-180 days", "17%p.a", Colors.green),
            rateTile("181-365 days", "21%p.a", Colors.blue),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(spacing * 2),
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: displayCard ? Colors.pink : Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
          ),
          onPressed: () {
            print(rateValue);
          },
          child: Text("Continue", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  Widget rateTile(String days, String rate, Color rateColor) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(width: 1.5, color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(days, style: TextStyle(fontSize: 12)),
          Text(
            rate,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: rateColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
