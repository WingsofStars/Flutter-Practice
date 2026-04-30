// data/in_memory_checklist_repository.dart
import 'package:flutter_application_1/data/checklist_repo.dart';
import 'package:flutter_application_1/models/daily_task_model.dart';


class InMemoryChecklistRepository implements ChecklistRepository {
  final Map<String, List<DailyTask>> _store = {
    "Daily Tasks": [
      DailyTask(description: "Do laundry"),
      DailyTask(description: "Go on a Run"),
      DailyTask(description: "Go to the Gym"),
      DailyTask(description: "Read 10 pages"),
      DailyTask(description: "Practice Spanish"),
      DailyTask(description: "Practice Piano"),
      DailyTask(description: "Journal"),
    ],
    "work": [
      DailyTask(description: "Send report"),
    ],
  };

  @override
  Future<List<DailyTask>> load(String listId) async {
    return _store[listId] ?? [];
  }

  @override
  Future<void> save(String listId, List<DailyTask> tasks) async {
    _store[listId] = tasks;
  }
}