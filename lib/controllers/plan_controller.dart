import 'package:master_plan/models/data_layers.dart';
// class to update Plan provider class
class PlanController{
  final _plans= <Plan>[];

  // Following getter method should not be modified. Its public getter method
  List<Plan> get plans{
    return List.unmodifiable(_plans);
  }

  // We need to check for duplicates !
  // Add Plan Method
  void addNewPlan(String name){
    if(name.isEmpty){
      return;
    }
    
    name= _checkForDuplicateCount(_plans.map((plan) => "${plan.name}"), name );
    final plan= Plan()..name = name;

    _plans.add(plan);
  }
  // Method for deleting a plan
  void deletePlan(Plan plan){
    _plans.remove(plan);
  }


  // Same as we wrote functions for plans, we are also going to write functions for Tasks
  void createNewTask(Plan plan , [String? description]){
    if(description == null || description.isEmpty){
      description = "Add Task ";
    }

    description = _checkForDuplicateCount(plan.tasks.map((task) => task.description) ,description  );
    final task= Task()..description = description;
    plan.tasks.add(task);
  }
  // Function to delete a task
  void deleteTask(Plan plan , Task task){
    plan.tasks.remove(task);
  }
  //  Function to check for plan text length and task description length
  String _checkForDuplicateCount(Iterable<String> items , String text){
    final duplicateCount= items
        .where((item) => item.contains(text)).length;

    if(duplicateCount > 0){
      text += "${duplicateCount + 1}";
    }

    return text;
  }


}