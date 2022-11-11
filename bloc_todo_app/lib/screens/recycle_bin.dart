import 'package:flutter/material.dart';
import 'package:to_do_app/blocs/blocs.dart';
import 'package:to_do_app/screens/screens.dart';
import 'package:to_do_app/widgets/widgets.dart';

class RecycleBin extends StatelessWidget {
  static const String routeName = "/bin";

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const RecycleBin(),
    );
  }

  const RecycleBin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete_forever),
                      label: const Text("Clear Bin"),
                    ),
                    onTap: () =>
                        context.read<TasksBloc>().add(DeleteAllTasks()),
                  )
                ],
              )
            ],
          ),
          drawer: const MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text('${state.removedTasks.length} Tasks'),
                ),
              ),
              TasksList(tasksList: state.removedTasks)
            ],
          ),
        );
      },
    );
  }
}
