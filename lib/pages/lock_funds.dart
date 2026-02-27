import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';
import 'package:second_flutter/components/lock_container.dart';
import 'package:second_flutter/pages/createDigiLock/create_digi_lock.dart';
import 'package:second_flutter/pages/landing_home.dart';

class LockFunds extends StatefulWidget {
  const LockFunds({super.key});

  @override
  State<LockFunds> createState() => _LockFundsState();
}

class _LockFundsState extends State<LockFunds> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LandingHome()));
        }, icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.pink,
                Colors.pink.shade700,
                Colors.transparent,
                Colors.pink.shade300,
                Colors.transparent
                
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
          ),
          padding: isMobile ? EdgeInsets.all(10) : EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LockContainer(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Fixed Savings", style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 13 : 15),),
                    customSavingsCard("Rent Money", 17, "200,000", "2026-01-05 14:35:41.438", "18,630", "218,630", 45),
                    customSavingsCard("Rent Money", 17, "200,000", "2026-01-05 14:35:41.438", "18,630", "218,630", 245),
                    customSavingsCard("Rent Money", 17, "200,000", "2026-01-05 14:35:41.438", "18,630", "218,630", 145),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    Text("Recent Activity", style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 13 : 15),),
                    customRecentActivities(Icons.add, Colors.green.shade900, Colors.green.shade300, "Fixed Plan Created", "Rent Money savings plan created", "200,000", "lock", "2026-01-05 14:35:41.438"),
                    customRecentActivities(Icons.percent, Colors.orangeAccent.shade700, Colors.orange.shade300, "Interest Earned", "Monthly interest on Rent Money", "200,000", "savings", "2026-01-05 14:35:41.438"),
                    customRecentActivities(Icons.add, Colors.green.shade900, Colors.green.shade300, "Fixed Plan Created", "School fees savings plan created", "500,000", "lock", "2026-01-05 14:35:41.438"),
                    customRecentActivities(Icons.percent, Colors.deepOrangeAccent.shade700, Colors.orange.shade300, "Interest earned", "Monthly interest on school fees", "8,750", "savings", "2026-01-05 14:35:41.438"),
                    customRecentActivities(Icons.add, Colors.green.shade900, Colors.green.shade300, "Fixed Plan Created", "Rent Money savings plan created", "150,000", "lock", "2026-01-05 14:35:41.438"),
                    customRecentActivities(Icons.check_circle_outline_sharp, Colors.greenAccent.shade700, Colors.green.shade300, "Plans Matured", "Car down payment completed", "105,250", "savings", "2026-01-05 14:35:41.438"),
                    customRecentActivities(Icons.trending_up, Colors.redAccent.shade700, Colors.red.shade300, "Funds Withdrawn", "Matured funds transferred to digiwallet", "105,250", "withdrawal", "2026-01-05 14:35:41.438"),
                    SizedBox(height: 70,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateDigiLock()));
        },
        shape: CircleBorder(),
        backgroundColor: Colors.pink,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget customSavingsCard(String title, int rate, String principal, String maturityDate, String projectedReturn, String maturityReturnValue, int daysRemaining,){
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    DateTime date = DateTime.parse(maturityDate);
    double spacing = isMobile ? 5 : 8;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
      color: theme.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 13 : 15),),
                  Text("$rate% APY", style: TextStyle(color: Colors.green.shade700, fontSize: isMobile ? 10 : 12, fontWeight: FontWeight.w600),)
                ],
              ),
              Row(
                children: [
                  Icon(Icons.lock_outline, color: Colors.green[700],size: isMobile ? 15 : 18,),
                  Text("LOCKED", style: TextStyle(color: Colors.green.shade700, fontSize: isMobile ? 10 : 12),)
                ],
              )
            ],
          ),
          SizedBox(height: spacing * 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Principal", style: TextStyle(fontSize: isMobile ? 11 : 13),),
              Text("₦$principal", style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 12 : 14),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Maturity Date", style: TextStyle(fontSize: isMobile ? 11 : 13),),
              Text(DateFormat("MMM dd, yyyy").format(date), style: TextStyle(fontWeight: FontWeight.w500, fontSize: isMobile ? 12 : 14),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Projected Return", style: TextStyle(fontSize: isMobile ? 11 : 13),),
              Text("+₦$projectedReturn", style: TextStyle(color: Colors.green.shade700,fontWeight: FontWeight.w500, fontSize: isMobile ? 12 : 14),)
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total at Maturity", style: TextStyle(fontWeight: FontWeight.bold, fontSize:  isMobile ? 12 : 14),),
              Text("₦$maturityReturnValue", style: TextStyle(fontWeight: FontWeight.bold, fontSize:  isMobile ? 12 : 14),)
            ],
          ),
          SizedBox(height: spacing,),
          LinearProgressIndicator(
            value: (daysRemaining/365),
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation(Colors.pink),
          ),
          SizedBox(height: spacing,),
          Text("$daysRemaining days remaining", style: TextStyle(fontSize: isMobile ? 10 : 12),)
        ],
      ),
    );
  }

  Widget customRecentActivities(IconData icon, Color iconColor, Color avatarColor, String title, String subtitle, String value, String valueType, String activityDate){
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    DateTime date = DateTime.parse(activityDate);
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    return Container(
      padding: EdgeInsets.symmetric(vertical: spacing),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: isMobile ? 12 : 15,
                backgroundColor: avatarColor,
                child: Icon(icon, size: isMobile ? 15 : 18,color: iconColor,),
              ),
              SizedBox(width: spacing,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: isMobile ? 11 : 13, fontWeight: FontWeight.bold),),
                  Text(subtitle, style: TextStyle(fontSize: isMobile ? 9 : 11),),
                  Text(valueType == "savings" ? "+₦$value" : "₦$value", style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 12 : 14, color: valueType == "savings" ? Colors.green : theme.colorScheme.surfaceContainerLow),)
                ],
              )
            ],
          ),
          Text(DateFormat("MMM dd, yyyy  hh:mm a").format(date), style: TextStyle(fontSize: isMobile ? 9 : 11),)
        ],
      ),
    );
  }
}