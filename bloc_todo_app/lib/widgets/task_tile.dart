import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/blocs/blocs.dart';
import 'package:to_do_app/models/models.dart';
import 'package:to_do_app/screens/screens.dart';
import 'package:to_do_app/widgets/widgets.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  void _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }

  void _editTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: EditTaskScreen(
            oldTask: task,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                task.isFavorite == false
                    ? const Icon(Icons.star_outline)
                    : const Icon(Icons.star),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(DateFormat()
                          .add_yMMMd()
                          .add_Hms()
                          .format(DateTime.parse(task.date))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: task.isDone,
                onChanged: task.isDeleted == false
                    ? (value) {
                        context.read<TasksBloc>().add(UpdateTask(task: task));
                      }
                    : null,
              ),
              PopupMenu(
                task: task,
                cancelOrDeleteCallback: () =>
                    _removeOrDeleteTask(context, task),
                favoriteOrUnfavoriteCallback: () => context
                    .read<TasksBloc>()
                    .add(MarkFavoriteOrUnfavoriteTask(task: task)),
                editCallback: () {
                  _editTask(context);
                  Navigator.pop(context);
                },
                restoreCallback: () =>
                    context.read<TasksBloc>().add(RestoreTask(task: task)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
