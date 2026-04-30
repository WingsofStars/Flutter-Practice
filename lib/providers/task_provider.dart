import 'package:flutter_application_1/models/daily_task_model.dart';
import 'package:flutter_application_1/providers/checklist_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final checklistProvider = AsyncNotifierProvider.family<
    ChecklistNotifier, List<DailyTask>, String>(
  ChecklistNotifier.new,
);
