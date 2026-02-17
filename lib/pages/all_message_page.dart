import 'package:flutter/material.dart';

class AllMessagePage extends StatefulWidget {
  final double screenWith;
  final bool isMobile;
  final double spacing;
  final List<Map<String, dynamic>> messages;

  const AllMessagePage({
    super.key,
    required this.screenWith,
    required this.isMobile,
    required this.spacing,
    required this.messages,
  });

  @override
  State<AllMessagePage> createState() => _AllMessagePageState();
}

class _AllMessagePageState extends State<AllMessagePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.messages.length,
      padding: EdgeInsets.symmetric(vertical: widget.spacing),
      itemBuilder: (context, index) {
        final item = widget.messages[index];

        return Container(
          padding: EdgeInsets.all(widget.spacing),
          margin: EdgeInsets.symmetric(vertical: widget.spacing),
          decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 
              Stack(
                alignment: Alignment.topRight,
                children: [
                  CircleAvatar(
                    backgroundColor: item["avatarColor"],
                    child: Icon(item["leadingIcon"], color: item["iconColor"],),
                  ),
                  item["isTitleIconPresent"]?Positioned(
                    right: 0,
                    top: 0,
                    child: Icon(
                      Icons.fiber_manual_record_sharp,
                      size: widget.spacing * 2
                      ,
                      color: Colors.red,
                    ),
                  ):SizedBox(),
                ],
              ),

              SizedBox(width: widget.spacing),

              // ================= RIGHT CONTENT =================
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // ================= TOP ROW =================
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // LEFT SIDE (TitleIcon + Title)
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              // Title Icon
                              if (item["titleIcon"] != null)
                                Padding(
                                  padding: const EdgeInsets.only(right: 6),
                                  child: Icon(
                                    item["titleIcon"],
                                    size: widget.isMobile ? 16 : 20,
                                    color: item["iconColor"],
                                  ),
                                ),

                              // Title Text
                              Expanded(
                                child: Text(
                                  item["title"],
                                  style: TextStyle(
                                    fontSize:
                                        widget.isMobile ? 13 : 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // RIGHT SIDE (Time Row)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.watch_later_outlined,
                              size: widget.isMobile ? 12 : 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              item["time"],
                              style: TextStyle(
                                fontSize:
                                    widget.isMobile ? 9 : 11,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: widget.spacing),

                    // ================= SUBTITLE =================
                    Text(
                      item["subtitle"],
                      style: TextStyle(
                        fontSize: widget.isMobile?10:12
                      ),
                    ),

                    SizedBox(height: widget.spacing),

                    // ================= BOTTOM ROW =================
                    Row(
                      children: [

                        // Activity Type (left side)
                        Expanded(
                          child: Text(
                            item["activity_type"],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: widget.isMobile?9:11),
                          ),
                        ),

                        // Button + Arrow (right side)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(0, 0),
                                tapTargetSize:
                                    MaterialTapTargetSize
                                        .shrinkWrap,
                              ),
                              child: Text(item["redirection"], style: TextStyle(fontSize: widget.isMobile?9:11),),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.chevron_right_sharp,
                              color: Colors.blueAccent,
                              size: widget.isMobile?10:11,
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
      },
    );
  }
}


// import 'package:flutter/material.dart';

// class AllMessagePage extends StatefulWidget {
//   final double screenWith;
//   final bool isMobile;
//   final double spacing;
//   final List<Map<String, dynamic>> messages;
//   const AllMessagePage({
//     super.key,
//     required this.screenWith,
//     required this.isMobile,
//     required this.spacing,
//     required this.messages,
//   });

//   @override
//   State<AllMessagePage> createState() => _AllMessagePageState();
// }

// class _AllMessagePageState extends State<AllMessagePage> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         decoration: BoxDecoration(),
//         child: Column(
//           children: [
//             ...widget.messages.map((item) {
//               return Container(
//                 padding: EdgeInsets.all(widget.spacing),
//                 width: double.infinity,
//                 margin: EdgeInsets.symmetric(vertical: widget.spacing * 2),
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 1.5),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   children: [
//                     ListTile(
//                       contentPadding: EdgeInsets.zero,
//                       minVerticalPadding: 0,
//                       leading: Stack(
//                         alignment: Alignment.topRight,
//                         children: [
//                           CircleAvatar(
//                             backgroundColor: item["avatarColor"],
//                             child: Icon(
//                               item["leadingIcon"],
//                               color: item["iconColor"],
//                             ),
//                           ),
//                           Icon(
//                             item["stacked"] == true
//                                 ? Icons.fiber_manual_record_sharp
//                                 : null,
//                             size: widget.spacing * 2,
//                             color: Colors.red.shade900,
//                           ),
//                         ],
//                       ),
//                       title: item["isTitleIconPresent"]
//                           ? Row(
//                               children: [
//                                 Icon(
//                                   item["isTitleIconPresent"]
//                                       ? item["titleIcon"]
//                                       : null,
//                                   color: item["iconColor"],
//                                 ),
//                                 Expanded(child: Text(item["title"])),
//                               ],
//                             )
//                           : Expanded(child: Text(item["title"])),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(
//                             Icons.watch_later_outlined,
//                             size: widget.isMobile ? 12 : 16,
//                           ),
//                           const SizedBox(width: 4),
//                           Text(
//                             item["time"],
//                             style: TextStyle(
//                               fontSize: widget.isMobile ? 9 : 11,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: widget.spacing * 10),
//                       child: Text(item["subtitle"]),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: widget.spacing * 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(item["activity_type"]),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(item["redirection"]),
//                               Icon(Icons.chevron_right_outlined),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
