import 'package:flutter_application_1/models/daily_task_model.dart';

abstract class ChecklistRepository {
  Future<List<DailyTask>> load(String listId);
  Future<void> save(String listId, List<DailyTask> tasks);
}