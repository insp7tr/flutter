import 'package:flutter/material.dart';
import 'package:to_do_app/blocs/blocs.dart';
import 'package:to_do_app/models/models.dart';

class EditTaskScreen extends StatelessWidget {
  final Task oldTask;

  const EditTaskScreen({
    Key? key,
    required this.oldTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: oldTask.title);
    TextEditingController descController =
        TextEditingController(text: oldTask.description);

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text("Add Task", style: TextStyle(fontSize: 24)),
          const SizedBox(height: 10),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
              label: Text("Title"),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            autofocus: true,
            controller: descController,
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
              label: Text("Description"),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  var editedTask = Task(
                    title: titleController.text,
                    description: descController.text,
                    date: DateTime.now().toString(),
                    isFavorite: oldTask.isFavorite,
                    isDone: oldTask.isDone,
                    id: oldTask.id,
                  );

                  context
                      .read<TasksBloc>()
                      .add(EditTask(oldTask: oldTask, newTask: editedTask));
                  Navigator.pop(context);
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
