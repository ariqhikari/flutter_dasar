part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterStateFilled extends CounterState {
  final int value;

  CounterStateFilled(this.value);
}
