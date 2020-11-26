import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_first_flutter/warrior.dart';

class MockWarrior extends Mock implements Warrior {}

void main() {
  MockWarrior warrior = MockWarrior();

  test("Verify Demo", () {
    warrior.rest();
    verify(warrior.rest());
  });

  test("Null Demo", () {
    expect(warrior.name, isNull);
  });

  test("thenReturn Demo", () {
    when(warrior.name).thenReturn("no name");
    expect(warrior.name, equals("no name"));
  });
}
