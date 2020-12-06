part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class InitializedCounter extends CounterState {
  final int number;

  InitializedCounter(this.number);
}
