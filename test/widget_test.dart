// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_first_flutter/cubit/counter_cubit.dart';

import 'package:my_first_flutter/main.dart';

void main() {
  group("Counter Cubit Test", () {
    blocTest(
      "Initial Test",
      build: () => CounterCubit(),
      expect: [],
    );

    blocTest(
      "Increment Test for the first time",
      build: () => CounterCubit(),
      act: (CounterCubit cubit) => cubit.increment(1),
      expect: [0],
    );

    blocTest(
      "Increment Test",
      build: () => CounterCubit(),
      act: (CounterCubit cubit) {
        cubit.increment(1);
        cubit.increment(2);
      },
      expect: [0, 2],
    );

    blocTest(
      "Doing Nothing Test",
      build: () => CounterCubit(),
      act: (CounterCubit cubit) {
        cubit.increment(1);
        cubit.increment(2);
        cubit.increment(0);
        cubit.increment(3);
      },
      expect: [0, 2, 5],
    );
  });
}
