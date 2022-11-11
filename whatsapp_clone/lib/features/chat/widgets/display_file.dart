import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/enums/message_enums.dart';
import 'package:whatsapp_clone/features/chat/widgets/video_player_item.dart';

class DisplayFile extends StatelessWidget {
  final String message;
  final MessageEnum type;

  const DisplayFile({
    super.key,
    required this.message,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    bool isPlaying = false;
    final AudioPlayer audioPlayer = AudioPlayer();

    switch (type) {
      case MessageEnum.text:
        return Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 30,
            top: 5,
            bottom: 20,
          ),
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        );
      case MessageEnum.image:
        return Padding(
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
            top: 5,
            bottom: 5,
          ),
          child: CachedNetworkImage(imageUrl: message),
        );
      case MessageEnum.video:
        return Padding(
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
            top: 5,
            bottom: 5,
          ),
          child: VideoPlayerItem(videoUrl: message),
        );
      case MessageEnum.gif:
        return Padding(
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
            top: 5,
            bottom: 5,
          ),
          child: CachedNetworkImage(imageUrl: message),
        );
      case MessageEnum.audio:
        return Padding(
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
            top: 5,
            bottom: 5,
          ),
          child: StatefulBuilder(builder: (context, setState) {
            return IconButton(
              constraints: const BoxConstraints(
                minWidth: 100,
              ),
              onPressed: () async {
                if (isPlaying) {
                  await audioPlayer.pause();
                  setState(() {
                    isPlaying = false;
                  });
                } else {
                  await audioPlayer.play(UrlSource(message));
                  setState(() {
                    isPlaying = false;
                  });
                }
              },
              icon: Icon(isPlaying ? Icons.pause_circle : Icons.play_circle),
            );
          }),
        );
      default:
        return Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 30,
            top: 5,
            bottom: 20,
          ),
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        );
    }
  }
}
