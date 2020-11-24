import 'package:flutter_test/flutter_test.dart';
import 'package:my_first_flutter/model/person.dart';

void main() {
  Person p;
  p = Person();

  test("Inisialisasi Objek Person", () {
    expect(p.name, equals("no name"));
  });
}
