// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Call {
  final String callerId;
  final String callername;
  final String callerPic;
  final String receiverId;
  final String receiverPic;
  final String callId;
  final bool hasDialled;

  Call({
    required this.callerId,
    required this.callername,
    required this.callerPic,
    required this.receiverId,
    required this.receiverPic,
    required this.callId,
    required this.hasDialled,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'callerId': callerId,
      'callername': callername,
      'callerPic': callerPic,
      'receiverId': receiverId,
      'receiverPic': receiverPic,
      'callId': callId,
      'hasDialled': hasDialled,
    };
  }

  factory Call.fromMap(Map<String, dynamic> map) {
    return Call(
      callerId: map['callerId'] as String,
      callername: map['callername'] as String,
      callerPic: map['callerPic'] as String,
      receiverId: map['receiverId'] as String,
      receiverPic: map['receiverPic'] as String,
      callId: map['callId'] as String,
      hasDialled: map['hasDialled'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Call.fromJson(String source) =>
      Call.fromMap(json.decode(source) as Map<String, dynamic>);
}
