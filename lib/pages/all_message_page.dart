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
          margin:
              EdgeInsets.symmetric(vertical: widget.spacing),
          decoration: BoxDecoration(
            border: Border.all(width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,

            // ---------------- LEADING ----------------
            leading: Stack(
              alignment: Alignment.topRight,
              children: [
                CircleAvatar(
                  child: Icon(item["leadingIcon"]),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Icon(
                    Icons.fiber_manual_record_sharp,
                    size: widget.spacing * 3,
                    color: Colors.green,
                  ),
                ),
              ],
            ),

            // ---------------- TITLE ----------------
            title: Text(
              item["title"],
              style: TextStyle(
                fontSize:
                    widget.isMobile ? 12 : 14,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            // ---------------- SUBTITLE ----------------
            subtitle: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),

                Text(
                  item["subtitle"],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    // LEFT SIDE (activity type)
                    Expanded(
                      child: Text(
                        item["activity_type"],
                        overflow:
                            TextOverflow.ellipsis,
                      ),
                    ),

                    // RIGHT SIDE (button + icon)
                    Row(
                      mainAxisSize:
                          MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () {},
                          style:
                              TextButton.styleFrom(
                            padding:
                                EdgeInsets.zero,
                            minimumSize:
                                const Size(0, 0),
                            tapTargetSize:
                                MaterialTapTargetSize
                                    .shrinkWrap,
                          ),
                          child:
                              Text(item["redirection"]),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons
                              .chevron_right_sharp,
                          size: 18,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            // ---------------- TRAILING ----------------
            trailing: Row(
              mainAxisSize:
                  MainAxisSize.min, // 🔥 prevents overflow
              children: [
                Icon(
                  Icons.watch_later_outlined,
                  size:
                      widget.isMobile ? 12 : 16,
                ),
                const SizedBox(width: 4),
                Text(
                  item["time"],
                  style: TextStyle(
                    fontSize:
                        widget.isMobile
                            ? 9
                            : 11,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
