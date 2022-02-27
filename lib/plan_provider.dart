import 'package:flutter/material.dart';
import 'package:master_plan/models/data_layers.dart';


class PlanProvider extends InheritedWidget{
  final _plans = <Plan>[];

  PlanProvider({required Widget child}) : super(child: child);

  // We have to build two functions
  // 1- bool UpdateShouldNotify
  @override
  bool updateShouldNotify(InheritedWidget oldWidget){
    return false;
  }
  // 2- Static function
  static List<Plan> of(BuildContext context){
    final provider= context.dependOnInheritedWidgetOfExactType<PlanProvider>();
    return provider!._plans;
  }
}