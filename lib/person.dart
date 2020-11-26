import 'package:equatable/equatable.dart';

class Person extends Equatable {
  String name;
  int age;

  Person({this.name = "no name", this.age = 0});

  @override
  List<Object> get props => [name, age];

  // @override
  // operator ==(other) {
  //   if (other is Person) {
  //     if (name == other.name && age == other.age) return true;
  //   }

  //   return false;
  // }
}
