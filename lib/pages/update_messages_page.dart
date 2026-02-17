import 'package:flutter/material.dart';

class UpdateMessagesPage extends StatefulWidget {
    final double screenWith;
  final bool isMobile;
  final double spacing;
  final List<Map<String, dynamic>> messages;
  const UpdateMessagesPage({super.key, required this.screenWith, required this.isMobile, required this.spacing, required this.messages});

  @override
  State<UpdateMessagesPage> createState() => _UpdateMessagesPageState();
}

class _UpdateMessagesPageState extends State<UpdateMessagesPage> {
  @override
  Widget build(BuildContext context) {
        List<Map<String, dynamic>> updates = widget.messages
        .where((item) => item["isUpdates"] == true)
        .toList();
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          children: [
            ...updates.map((item) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: widget.spacing),
                padding: EdgeInsets.all(widget.spacing / 2),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        CircleAvatar(
                          backgroundColor: item["avatarColor"],
                          child: Icon(item["leadingIcon"], color: item["iconColor"],),
                        ),
                        Icon(
                          Icons.fiber_manual_record,
                          size: widget.spacing * 2,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    SizedBox(width: widget.spacing),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            horizontalTitleGap: 0,
                            minLeadingWidth: 0,
                            contentPadding: EdgeInsets.all(0),
                            minVerticalPadding: 0,
                            minTileHeight: 0,
                            leading: item["isTitleIconPresent"]?Icon(
                              item["titleIcon"],
                              size: widget.isMobile ? 16 : 20,
                              color: item["iconColor"],
                            ):null,
                            title: Padding(
                              padding : EdgeInsets.symmetric(vertical: widget.spacing),
                              child: Text(
                                  item["title"],
                                  style: TextStyle(
                                    fontSize: widget.isMobile ? 13 : 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                            ),
                            // ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.watch_later_outlined,
                                  size: widget.isMobile ? 12 : 16,
                                ),
                                Text(
                                  item["time"],
                                  style: TextStyle(
                                    fontSize: widget.isMobile ? 9 : 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            item["subtitle"],
                            style: TextStyle(
                              fontSize: widget.isMobile ? 10 : 12,
                            ),
                          ),
                          SizedBox(height: widget.spacing,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Text(
                                  item["activity_type"],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: widget.isMobile ? 9 : 11,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      // print(promotion);
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: const Size(0, 0),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text(
                                      item["redirection"],
                                      style: TextStyle(
                                        fontSize: widget.isMobile ? 9 : 11,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.chevron_right_sharp,
                                    color: Colors.blueAccent,
                                    size: widget.isMobile ? 10 : 11,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}