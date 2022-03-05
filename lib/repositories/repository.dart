import 'package:flutter/foundation.dart';

abstract class Repository{ // Abstruct class is just a solid block which we can use to modify in other classes.
  // this is basically class Interface: Blue print
  //The interface in the dart provides the user with the blueprint of the class,
  // that any class should follow if it interfaces that class i.e.
  // if a class inherits another it should redefine each function present inside an interfaced class in its way.
  // They are nothing but a set of methods defined for an object
  Model create();

  List<Model> getAll();
  // get Id
  Model? get(int id);
  void update(Model item);

  void delete(Model item);
  void clear();
}

class Model{
  final int id;
  final Map data;

  Model(@required this.id , {this.data = const {}});


}