import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/common/enums/message_enums.dart';
import 'package:whatsapp_clone/features/chat/widgets/display_file.dart';

class MyMessageCard extends StatelessWidget {
  final String message;
  final String date;
  final MessageEnum type;
  final VoidCallback onLeftSwipe;
  final String repliedText;
  final String username;
  final MessageEnum repliedMessageType;
  final bool isSeen;

  const MyMessageCard({
    Key? key,
    required this.message,
    required this.date,
    required this.type,
    required this.onLeftSwipe,
    required this.repliedText,
    required this.username,
    required this.repliedMessageType,
    required this.isSeen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isReplying = repliedText.isNotEmpty;

    return SwipeTo(
      onLeftSwipe: onLeftSwipe,
      child: Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45,
          ),
          child: Card(
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: messageColor,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Stack(
              children: [
                Column(
                  children: [
                    if (isReplying) ...[
                      const SizedBox(height: 3),
                      Text(
                        username,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: backgroundColor.withOpacity(0.5),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: DisplayFile(
                          message: repliedText,
                          type: repliedMessageType,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                    DisplayFile(message: message, type: type),
                  ],
                ),
                Positioned(
                  bottom: 4,
                  right: 10,
                  child: Row(
                    children: [
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white60,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        isSeen ? Icons.done_all : Icons.done,
                        size: 20,
                        color: isSeen ? Colors.blue : Colors.white60,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}