import 'package:flutter/material.dart';
import 'package:master_plan/models/data_layers.dart';
import 'package:master_plan/plan_provider.dart';
import 'package:master_plan/views/plan_screen.dart';

class PlanCreatorScreen extends StatefulWidget {
  const PlanCreatorScreen({Key? key}) : super(key: key);

  @override
  _PlanCreatorScreenState createState() => _PlanCreatorScreenState();
}

class _PlanCreatorScreenState extends State<PlanCreatorScreen> {
  final textController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Master Plan"),
        backgroundColor: Color(0xffDDAF53),
      ),
      body: Column( // here we will show first TextField and after that all plans list
        children: <Widget>[
          _buildListCreator(), // TextField to add a plan when a user presses it and it will pop out
          Expanded(
        child: _buildMasterPlans(),
    )
        ],
      ),
    );
  }
  Widget _buildListCreator(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material( // Wrapped TextField in a material to make the field popout
        elevation: 10,
        color: Theme.of(context).cardColor,
        child: TextField(
          controller: textController,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: (Color(0xffDDAF53)))),
            label: Text("Add a plan", style: TextStyle(fontSize: 18, color: Color(0xffDDAF53)),),
            contentPadding: EdgeInsets.all(20)
          ),
          onEditingComplete: addPlan,
        ),
      ),
    );
  }
  // AddPlan Method:
  void addPlan(){
    final text= textController.text;


    final controller= PlanProvider.of(context);
    controller.addNewPlan(text);
    textController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {}); // to refresh the state
  }

  // _buildMasterPlans Method so that each method contains unique title and inside each have different plans
  Widget _buildMasterPlans(){
    final plans = PlanProvider.of(context).plans;
    if(plans.isEmpty){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.note_add, size: 100, color: Colors.grey),
          SizedBox(height: 5,),
          Text("You have added no Plans! Please enter to add one.")
        ],
      );
    }

    return ListView.builder(
      itemCount: plans.length,
      itemBuilder: (context, index){
        final plan = plans[index];
        return Dismissible(
          key: ValueKey(plan) ,
          background: Container(color: Color(0xffDDAF53)),
          direction: DismissDirection.endToStart,
          onDismissed: (_){
            final controller= PlanProvider.of(context);
            controller.deletePlan(plan);
            setState(() {});
          },
          child: ListTile(
            title: Text("${plan.name  }"),
            subtitle: Text("${plan.completeness}"),
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => PlanScreen(plan:plan))
              );
            },
          ),
        );
      },

    );
  }


  @override
  void dispose(){
    textController.dispose();
    super.dispose();
  }
}
