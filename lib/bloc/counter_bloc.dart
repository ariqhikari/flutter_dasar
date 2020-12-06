import 'dart:async';

import 'package:meta/meta.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends ReplayBloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial());

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is Increment) {
      if (state is CounterInitial) {
        yield InitializedCounter(0);
      } else {
        yield InitializedCounter((state as InitializedCounter).number + 1);
      }
    }
  }
}
