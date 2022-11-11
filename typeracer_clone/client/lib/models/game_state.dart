// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GameState {
  final String id;
  final List players;
  final bool isJoin;
  final bool isOver;
  final List words;

  GameState({
    required this.id,
    required this.players,
    required this.isJoin,
    required this.isOver,
    required this.words,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'players': players,
      'isJoin': isJoin,
      'isOver': isOver,
      'words': words,
    };
  }

  factory GameState.fromMap(Map<String, dynamic> map) {
    return GameState(
      id: map['id'] as String,
      players: List.from(map['players'] as List),
      isJoin: map['isJoin'] as bool,
      isOver: map['isOver'] as bool,
      words: List.from(map['words'] as List),
    );
  }

  String toJson() => json.encode(toMap());

  factory GameState.fromJson(String source) =>
      GameState.fromMap(json.decode(source) as Map<String, dynamic>);
}
