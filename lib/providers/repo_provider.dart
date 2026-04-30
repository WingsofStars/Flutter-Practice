import 'package:flutter_application_1/data/checklist_repo.dart';
import 'package:flutter_application_1/data/in_memory_checklist_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final checklistRepositoryProvider =
    Provider<ChecklistRepository>((ref) {
  return InMemoryChecklistRepository();
});