import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_flutter/a_List_providers/theme_provider.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  final List<Map<String, dynamic>> paymentMethods = [
    {
      "type": "card",
      "name": "•••• 4859",
      "brand": "Visa",
      "isDefault": true,
      "icon": Icons.credit_card,
    },
    {
      "type": "bank",
      "name": "GTBank ••••0123",
      "brand": "GTB",
      "isDefault": false,
      "icon": Icons.apartment_outlined,
    },
  ];
  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.read<ThemeProvider>().getTheme();
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double spacing = isMobile ? 5 : 8;
    return Container(
      padding: isMobile
          ? EdgeInsets.symmetric(vertical: 12)
          : EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Payment Methods",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 15 : 19,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Add New',
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: spacing),
          ...paymentMethods.map((method) {
            return Container(
              padding: isMobile ? EdgeInsets.all(8) : EdgeInsets.all(12),
              margin: isMobile
                  ? EdgeInsets.symmetric(vertical: 4)
                  : EdgeInsets.symmetric(vertical: 6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: theme.colorScheme.surfaceContainerHighest,
                border: Border.all(color: Colors.grey, width: 1.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue[300],
                        child: Icon(method["icon"]),
                      ),
                      SizedBox(width: spacing * 2),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            method["name"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile ? 13 : 16,
                            ),
                          ),
                          Text(
                            method["brand"],
                            style: TextStyle(fontSize: isMobile ? 10 : 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      method["isDefault"]
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromARGB(255, 211, 216, 205),
                              ),
                              padding: isMobile
                                  ? EdgeInsets.symmetric(horizontal: 5)
                                  : EdgeInsets.symmetric(horizontal: 7),
                              child: Text(
                                "Default",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 10, 238, 21),
                                  fontSize: isMobile ? 10.5 : 14.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : Text(""),
                      Icon(
                        Icons.chevron_right_sharp,
                        color: Colors.grey,
                        size: isMobile ? 15 : 20,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
