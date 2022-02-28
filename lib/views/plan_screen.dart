import 'package:flutter/material.dart';
import 'package:master_plan/plan_provider.dart';
import '../models/data_layers.dart';

class PlanScreen extends StatefulWidget {
  final Plan? plan;
  const PlanScreen({Key? key, this.plan}) : super(key: key);

  @override
  _PlanScreenState createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  Plan? get plan => widget.plan;
  // ScrollController? scrollController;
  // @override
  // void initState(){
  //   super.initState();
  //   scrollController=  ScrollController()
  //   ..addListener((){
  //     FocusScope.of(context).requestFocus(FocusNode());
  //
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    // final plan = PlanProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffDDAF53),
        title: Text("${plan!.name}"),
      ),
      body: Column(
        children: [
          Expanded(
              child: _buildList()
          ),
          SafeArea(
              child:Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text("${plan!.completeness}" , style: TextStyle(fontSize: 20),)
              )
          )
        ],
      ),
      floatingActionButton: _buildAddTaskButton(),
    );
  }

  // Add Plan Widget
  Widget _buildAddTaskButton(){
    // final plan = PlanProvider.of(context);
    return FloatingActionButton(
      backgroundColor: Color(0xffDDAF53),
      onPressed: (){
        setState(() {
          final controller= PlanProvider.of(context);
          controller.createNewTask(plan!);
        });
      },
      child: Icon(Icons.add ),

    );
  }
  // _buildList Widget
  Widget _buildList(){
    // final plan = PlanProvider.of(context);
    return ListView.builder(
      // controller: scrollController,
      itemCount: plan!.tasks.length,
      itemBuilder: (context, index){
        return _buildTaskTile(plan!.tasks[index]);
      },
    );
  }
  // _buildTaskTile Widget
  Widget _buildTaskTile(task){
    // final plan= PlanProvider.of(context);
    return Dismissible(
      key: ValueKey(task),
      direction: DismissDirection.endToStart,
      background: Container(color: Color(0xffDDAF53)),
      onDismissed: (_){
        final controller= PlanProvider.of(context);
        controller.deleteTask(plan! , task);
        setState(() {});
      },
      child: ListTile(
        leading: Checkbox(
          fillColor: MaterialStateProperty.all(Color(0xffDDAF53)),
          onChanged: (selected){
            setState(() {
              task.complete = selected;
            });
          },
          value: task.complete,
        ),

        title: TextFormField(

            decoration: InputDecoration(focusColor: Color(0xffDDAF53),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffDDAF53))), // When we write,color changes. Initial color blue
            fillColor: Color(0xffDDAF53),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color:Color(0xffDDAF53 ))
            ),
          ),
          initialValue: task.description,
          onChanged: (message){
            setState(() {
              task.description = message;
            });
          },
        ),
      ),
    );
  }

  // @override
  // void dispose(){
  // scrollController!.dispose();
  // super.dispose();
  // }

}

