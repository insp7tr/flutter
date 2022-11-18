import 'package:flutter/material.dart';
import 'package:notes_app/colors.dart';
import 'package:notes_app/views/home_view.dart';
import 'package:notes_app/views/note_widget.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.5,
            child: const NoteWidget(),
          ),
          const SizedBox(height: 32),
          Text(
            "Daily Notes",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: AppColors.white),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56),
            child: Text(
              "Take notes, reminders, set targets, collect resources and secure privacy",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.white),
            ),
          ),
          SizedBox(height: size.height * 0.1),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HomeView(),
              ));
            },
            child: Text(
              "Get started",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(height: size.height * 0.15),
        ],
      ),
    );
  }
}
