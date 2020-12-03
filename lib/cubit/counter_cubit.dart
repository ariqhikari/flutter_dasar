import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(null);

  void increment(int value) => emit((state != null) ? state + value : 0);
}
