import 'package:flutter_application_1/data/checklist_repo.dart';
import 'package:flutter_application_1/models/daily_task_model.dart';
import 'package:flutter_application_1/providers/repo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChecklistNotifier extends FamilyAsyncNotifier<List<DailyTask>, String> {
  late final String listId;
  late final ChecklistRepository repo;

  @override
  Future<List<DailyTask>> build(String listId) async {
    this.listId = listId;
    repo = ref.read(checklistRepositoryProvider);

    return repo.load(listId);
  }

  Future<void> addTask(String title) async {
    final current = state.value ?? [];

    final updated = [
      ...current,
      DailyTask(description: title),
    ];

    state = AsyncData(updated);
    await repo.save(listId, updated);
  }

  Future<void> toggleTask(String id) async {
    final current = state.value ?? [];

    final updated = [
      for (final t in current)
        t.description == id ? t.copyWith(isCompleted: !t.isCompleted) : t
    ];

    state = AsyncData(updated);
    await repo.save(listId, updated);
  }
}