import 'package:flutter/material.dart';
import 'package:google_search_clone/widgets/search_button.dart';

class SearchButtons extends StatelessWidget {
  const SearchButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            SearchButton(title: "Google Search"),
            SizedBox(width: 10),
            SearchButton(title: "I'm feeling Lucky"),
          ],
        )
      ],
    );
  }
}
