import 'task.dart'; // needed plan to complete the task 

class Plan{
  String? name;
  final List<Task> tasks= [];
// complete count method
  int get completeCount => tasks
      .where((task) => task.complete)
      .length;

  String get completeness{
    return '$completeCount out of ${tasks.length} tasks';
  }
}

