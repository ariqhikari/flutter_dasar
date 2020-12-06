part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent extends ReplayEvent {}

class Increment extends CounterEvent {}
