import 'package:bloc/bloc.dart';

class CounterBloc extends Bloc<int, int> {
  CounterBloc(int initialState) : super(initialState);

  @override
  Stream<int> mapEventToState(int event) async* {
    yield event;
  }
}
