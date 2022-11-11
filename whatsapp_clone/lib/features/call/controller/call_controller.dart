import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:whatsapp_clone/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_clone/features/call/repository/call_repository.dart';
import 'package:whatsapp_clone/models/call.dart';

final callControllerProvider = Provider((ref) {
  final callRepository = ref.read(callRepositoryProvider);

  return CallController(
    auth: FirebaseAuth.instance,
    callRepository: callRepository,
    ref: ref,
  );
});

class CallController {
  final FirebaseAuth auth;
  final CallRepository callRepository;
  final ProviderRef ref;

  CallController({
    required this.auth,
    required this.callRepository,
    required this.ref,
  });

  void makeCall(
    BuildContext context,
    String receiverName,
    String receiverUid,
    String receiverProfilePic,
    bool isGroupChat,
  ) {
    String callId = const Uuid().v1();

    ref.read(userDataAuthProvider).whenData((value) {
      Call senderCallData = Call(
        callerId: auth.currentUser!.uid,
        callername: value!.name,
        callerPic: value.profilePic,
        receiverId: receiverUid,
        receiverPic: receiverProfilePic,
        callId: callId,
        hasDialled: true,
      );

      Call receiverCallData = Call(
        callerId: auth.currentUser!.uid,
        callername: value.name,
        callerPic: value.profilePic,
        receiverId: receiverUid,
        receiverPic: receiverProfilePic,
        callId: callId,
        hasDialled: false,
      );

      callRepository.makeCall(senderCallData, context, receiverCallData);
    });
  }
}
