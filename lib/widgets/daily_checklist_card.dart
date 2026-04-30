import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/task_provider.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChecklistWidget extends ConsumerWidget {
  final String listId;
  // final List<Task> tasks;

  const ChecklistWidget({super.key, required this.listId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTasks = ref.watch(checklistProvider(listId));

    return asyncTasks.when(
      loading: () => const Center(child: CircularProgressIndicator()),

      error: (err, stack) => Center(child: Text('Error: $err')),

      data: (tasks) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tasks.length+1,
          itemBuilder: (context, index) {
            final task = index == 0 ? null : tasks[index - 1];
            return Container(
              margin: const EdgeInsets.only(left: 35, right: 35),
              padding: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: index == tasks.length ? 12 : 4), // add bottom padding to last item
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: index == 0 ? const Radius.circular(20) : Radius.zero,
                  topRight: index == 0
                      ? const Radius.circular(20)
                      : Radius.zero,
                  bottomLeft: index == tasks.length 
                      ? const Radius.circular(20)
                      : Radius.zero,
                  bottomRight: index == tasks.length 
                      ? const Radius.circular(20)
                      : Radius.zero,
                ),

                // borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (index == 0 )
                  Expanded(
                    child: Text(
                      listId, 
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                       textAlign: TextAlign.center,)
                  )

                  else ...[
                  Checkbox(
                    value: task!.isCompleted,
                    visualDensity: VisualDensity.compact, // ✅ removes extra space around checkbox
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (value) {
                      // handle completion via provider
                      ref
                          .read(checklistProvider(listId).notifier)
                          .toggleTask(task.description);
                    },
                  ),
                  Expanded(
                    child: Text(
                      task.description,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                      textAlign:
                          TextAlign.justify, // ✅ justifies text when it wraps
                    ),
                  ),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }
}
