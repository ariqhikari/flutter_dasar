import 'package:mobx/mobx.dart';
part 'counter.g.dart';

class CounterMobx = _CounterMobx with _$CounterMobx;

abstract class _CounterMobx with Store {
  @observable
  int value = 0;

  @action
  void increment() => value++;

  @action
  void decrement() => value--;
}
