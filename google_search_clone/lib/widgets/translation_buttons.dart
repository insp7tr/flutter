import 'package:flutter/material.dart';
import 'package:google_search_clone/widgets/language_text.dart';

class TranslationButtons extends StatelessWidget {
  const TranslationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: const [
          Text("Google offered in :"),
          SizedBox(width: 5),
          LanguageText(title: "English"),
          SizedBox(width: 5),
          LanguageText(title: "French"),
          SizedBox(width: 5),
          LanguageText(title: "Afrikaans"),
          SizedBox(width: 5),
          LanguageText(title: "Urdu"),
          SizedBox(width: 5),
          LanguageText(title: "Zulu"),
          SizedBox(width: 5),
          LanguageText(title: "Xhosa"),
          SizedBox(width: 5),
          LanguageText(title: "Arabic"),
          SizedBox(width: 5),
          LanguageText(title: "Italian"),
          SizedBox(width: 5),
          LanguageText(title: "Chinese"),
          SizedBox(width: 5),
          LanguageText(title: "Spanish"),
        ],
      ),
    );
  }
}
