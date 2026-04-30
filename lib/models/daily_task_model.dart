import 'package:flutter_application_1/models/task_model.dart';

class DailyTask extends Task {
  @override
  final String description;
  
  @override
  bool isCompleted;

  DailyTask({required this.description, this.isCompleted = false});

  @override
  void complete() {
    isCompleted = true;
  }
  DailyTask copyWith({bool? isCompleted}) {
    return DailyTask(
      description: description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}