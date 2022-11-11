import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:typeracer_clone/providers/game_state_provider.dart';
import 'package:typeracer_clone/utils/socket_client.dart';
import 'package:typeracer_clone/utils/socket_methods.dart';
import 'package:typeracer_clone/widgets/widgets.dart';

class GameTextField extends StatefulWidget {
  const GameTextField({super.key});

  @override
  State<GameTextField> createState() => _GameTextFieldState();
}

class _GameTextFieldState extends State<GameTextField> {
  final SocketMethods _socketMethods = SocketMethods();
  final TextEditingController _wordsController = TextEditingController();

  late GameStateProvider? game;
  var playerMe;
  bool isBtn = true;

  @override
  void initState() {
    super.initState();
    game = Provider.of<GameStateProvider>(context, listen: false);
    findPlayerMe(game!);
  }

  handleTextChange(String value, String gameID) {
    var lastChar = value[value.length - 1];

    if (lastChar == " ") {
      _socketMethods.sendUserInput(value, gameID);
      setState(() {
        _wordsController.text = "";
      });
    }
  }

  findPlayerMe(GameStateProvider game) {
    game.gameState['players'].forEach((player) {
      if (player['socketID'] == SocketClient.instance.socket!.id) {
        playerMe = player;
      }
    });
  }

  handleStart(GameStateProvider game) {
    _socketMethods.startTimer(playerMe['_id'], game.gameState['id']);
    setState(() {
      isBtn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final gameData = Provider.of<GameStateProvider>(context);

    return playerMe['isPartyLeader'] && isBtn
        ? CustomButton(
            text: "START",
            onTap: () => handleStart(gameData),
          )
        : TextFormField(
            readOnly: gameData.gameState['isJoin'],
            controller: _wordsController,
            onChanged: (value) =>
                handleTextChange(value, gameData.gameState['id']),
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
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              fillColor: const Color(0xfff5f5fa),
              hintText: "Type here",
              hintStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          );
  }
}
