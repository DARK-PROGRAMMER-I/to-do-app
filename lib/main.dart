import 'package:flutter/material.dart';
import 'package:master_plan/plan_provider.dart';
import 'package:master_plan/views/plan_creator_screen.dart';
import 'package:master_plan/views/plan_screen.dart';

void main() => runApp(PlanProvider(child: MasterPlan()));

class MasterPlan extends StatelessWidget {
  const MasterPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Master-Plan-App',
        theme: ThemeData(primaryColor: Color(0xffDDAF53)),
        // home
        home: PlanCreatorScreen() // this class will be created in the views folder's file plan_screen.dart
      );
  }
}
