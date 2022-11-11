// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ClientState {
  final Map<String, dynamic> timer;

  ClientState({
    required this.timer,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'timer': timer,
    };
  }

  factory ClientState.fromMap(Map<String, dynamic> map) {
    return ClientState(
      timer: Map<String, dynamic>.from(map['timer'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientState.fromJson(String source) =>
      ClientState.fromMap(json.decode(source) as Map<String, dynamic>);
}
