import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/notes.json', repeat: false);
  }
}
