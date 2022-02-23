import 'package:flutter/material.dart';
import 'package:master_plan/views/plan_screen.dart';

void main() => runApp(MasterPlan());

class MasterPlan extends StatelessWidget {
  const MasterPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Master-Plan-App',
      theme: ThemeData(primaryColor: Color(0xffDDAF53)),
      // home
      home: PlanScreen(), // this class will be created in the views folder's file plan_screen.dart
    );
  }
}
