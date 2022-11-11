import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:typeracer_clone/providers/client_state_provider.dart';
import 'package:typeracer_clone/providers/game_state_provider.dart';
import 'package:typeracer_clone/utils/socket_methods.dart';
import 'package:typeracer_clone/widgets/widgets.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateTimer(context);
    _socketMethods.updateGame(context);
    _socketMethods.gameFinishedListener();
  }

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameStateProvider>(context);
    final clientStateProvider = Provider.of<ClientStateProvider>(context);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                Chip(
                  label: Text(
                    clientStateProvider.clientState['timer']['msg'].toString(),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  clientStateProvider.clientState['timer']['countDown']
                      .toString(),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SentenceGame(),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: game.gameState['players'].length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Chip(
                              label: Text(
                                game.gameState['players'][index]['nickname'],
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            Slider(
                              value: (game.gameState['players'][index]
                                      ['currentWordIndex'] /
                                  game.gameState['words'].length),
                              onChanged: (value) {},
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                game.gameState['isJoin']
                    ? ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: TextField(
                          readOnly: true,
                          onTap: () {
                            Clipboard.setData(ClipboardData(
                              text: game.gameState['id'],
                            )).then(
                              (value) =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Game ID copied to clipboard"),
                                ),
                              ),
                            );
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            fillColor: const Color(0xfff5f5fa),
                            hintText: "Click to copy game ID",
                            hintStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          bottomNavigationBar: const GameTextField(),
        ),
      ),
    );
  }
}
