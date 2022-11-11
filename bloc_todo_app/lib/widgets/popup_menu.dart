import 'package:flutter/material.dart';
import 'package:to_do_app/models/models.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback favoriteOrUnfavoriteCallback;
  final VoidCallback editCallback;
  final VoidCallback restoreCallback;

  const PopupMenu({
    Key? key,
    required this.cancelOrDeleteCallback,
    required this.task,
    required this.favoriteOrUnfavoriteCallback,
    required this.editCallback,
    required this.restoreCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: task.isDeleted == false
          ? (context) => [
                PopupMenuItem(
                  onTap: null,
                  child: TextButton.icon(
                    onPressed: editCallback,
                    icon: const Icon(Icons.edit),
                    label: const Text("Edit"),
                  ),
                ),
                PopupMenuItem(
                  onTap: favoriteOrUnfavoriteCallback,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: task.isFavorite == false
                        ? const Icon(Icons.bookmark_add_outlined)
                        : const Icon(Icons.bookmark_remove),
                    label: task.isFavorite == false
                        ? const Text("Add to\nFavorites")
                        : const Text("Remove from\nFavorites"),
                  ),
                ),
                PopupMenuItem(
                  onTap: cancelOrDeleteCallback,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.delete),
                    label: const Text("Delete"),
                  ),
                ),
              ]
          : (context) => [
                PopupMenuItem(
                  onTap: restoreCallback,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.restore_from_trash),
                    label: const Text("Restore"),
                  ),
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.delete_forever),
                    label: const Text("Delete Forever"),
                  ),
                  onTap: () => cancelOrDeleteCallback,
                ),
              ],
    );
  }
}
