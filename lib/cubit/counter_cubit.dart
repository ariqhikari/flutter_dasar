import 'package:meta/meta.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends ReplayCubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void increment() {
    if (state is InitializedCounter) {
      emit(InitializedCounter((state as InitializedCounter).number + 1));
    } else {
      emit(InitializedCounter(0));
    }
  }
}
