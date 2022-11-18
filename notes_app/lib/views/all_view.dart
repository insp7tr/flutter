import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/colors.dart';
import 'package:notes_app/widgets/curved_box.dart';

class AllView extends StatelessWidget {
  const AllView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          FontAwesomeIcons.notesMedical,
          color: AppColors.white,
        ),
      ),
      body: AnimationLimiter(
        child: MasonryGridView.count(
          padding: const EdgeInsets.all(16),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          itemCount: 6,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              columnCount: 2,
              child: ScaleAnimation(
                child: index == 0
                    ? CurvedBox(
                        children: [
                          Text(
                            'Reminder',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const _ListTileRow(
                            isChecked: true,
                            text: "Exploration Design",
                          ),
                          const _ListTileRow(
                            isChecked: true,
                            text: "Kuliah",
                          ),
                          const _ListTileRow(
                            isChecked: false,
                            text: "Learn 3D Model",
                          ),
                          const _ListTileRow(
                            isChecked: false,
                            text: "Design shots",
                          ),
                          const DateFooter(date: 'Jan 17', footerText: 'ToDo')
                        ],
                      )
                    : index == 1
                        ? CurvedBox(
                            children: [
                              Text(
                                'Quote today',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                  '''"The best preparation for tomorrow us doing your best today"\n- H. Jackson Jr.'''),
                              const DateFooter(
                                  date: 'Jan 21', footerText: 'Quote')
                            ],
                          )
                        : index == 2
                            ? CurvedBox(
                                children: [
                                  Text(
                                    '2021 Hope',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                      'I have a dream that must come true !!'),
                                  const _ListTileRow(
                                      isChecked: true, text: 'GPA above 3.60'),
                                  const _ListTileRow(
                                      isChecked: true, text: 'Have an ipad'),
                                  const _ListTileRow(
                                      isChecked: false,
                                      text: 'Holidays in Japan'),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const DateFooter(
                                      date: 'Jan 21', footerText: 'My Targets')
                                ],
                              )
                            : index == 3
                                ? CurvedBox(
                                    padding: EdgeInsets.zero,
                                    children: [
                                      Container(
                                          height: 150,
                                          width: size.width,
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: Image.asset(
                                            'assets/travel.jpg',
                                            fit: BoxFit.cover,
                                          )),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Row(
                                          children: const [
                                            Icon(
                                              CupertinoIcons.location,
                                              color: AppColors.lightGrey,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              'Kuta Beach',
                                              style: TextStyle(
                                                  color: AppColors.lightGrey),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Text(
                                          'I stayed here for a big family vacation. This is a great affordable hotel to stay in Bali ...',
                                          style: TextStyle(
                                              color: AppColors.lightGrey),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: DateFooter(
                                            date: 'Dec 24',
                                            footerText: 'Daily Life'),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                    ],
                                  )
                                : index == 4
                                    ? CurvedBox(
                                        children: [
                                          Text(
                                            'Statistika',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Text(
                                              'Data science is the domain of study that deals with vast volumes of data using modern tools and techniques to find unseen patterns, derive meaningful information, and make business decisions.'),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          const DateFooter(
                                              date: 'Jan 21',
                                              footerText: 'My Targets')
                                        ],
                                      )
                                    : index == 5
                                        ? CurvedBox(
                                            children: [
                                              Text(
                                                'My Diary >,<',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                    CupertinoIcons.lock_fill,
                                                    size: 55,
                                                    color: AppColors.lightGrey,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              const DateFooter(
                                                  date: 'Jan 21',
                                                  footerText: 'My Targets')
                                            ],
                                          )
                                        : const SizedBox.shrink(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ListTileRow extends StatelessWidget {
  final String text;
  final bool isChecked;

  const _ListTileRow({Key? key, required this.text, required this.isChecked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 32,
          width: 16,
          child: Checkbox(
            shape: const CircleBorder(
                side: BorderSide(
              width: 2,
              color: AppColors.white,
            )),
            value: isChecked,
            activeColor: AppColors.white,
            checkColor: AppColors.grey,
            onChanged: (value) {},
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
                decoration: isChecked ? TextDecoration.lineThrough : null),
          ),
        ),
      ],
    );
  }
}

class DateFooter extends StatelessWidget {
  final String date, footerText;

  const DateFooter({super.key, required this.date, required this.footerText});

  final TextStyle style = const TextStyle(color: AppColors.lightGrey);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(date, style: style),
        Text(footerText, style: style),
      ],
    );
  }
}
