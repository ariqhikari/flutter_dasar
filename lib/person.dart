import 'package:equatable/equatable.dart';

class Person extends Equatable {
  final int id;
  final String name;
  final int age;

  Person({this.id, this.name, this.age});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json["id"],
      name: json["name"],
      age: json["age"],
    );
  }

  @override
  List<Object> get props => [id, name, age];
}
