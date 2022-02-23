import 'package:flutter/material.dart';
import '../models/data_layers.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({Key? key}) : super(key: key);

  @override
  _PlanScreenState createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final plan = Plan();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffDDAF53),
        title: Text("Master Plan"),
      ),
      body: _buildList(),
      floatingActionButton: _buildAddTaskButton(),
    );
  }

  // Add Plan Widget
  Widget _buildAddTaskButton(){
    return FloatingActionButton(
      backgroundColor: Color(0xffDDAF53),
      onPressed: (){
        plan.task.add(Task());
      },
      child: Icon(Icons.add , ),

    );
  }
  // _buildList Widget
  Widget _buildList(){
    return ListView.builder(
      itemCount: plan.task.length,
      itemBuilder: (context, index){
        return _buildTaskTile(plan.task[index]);
      },
    );
  }
  // _buildTaskTile Widget
  Widget _buildTaskTile(Task task){
    return ListTile(
      title: Text("${task}"),
    );
  }

}

