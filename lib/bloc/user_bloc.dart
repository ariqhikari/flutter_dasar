import 'package:bloc/bloc.dart';
import 'package:my_first_flutter/model/user.dart';

class UserBloc extends Bloc<int, User> {
  UserBloc(UninitializedUser initialState) : super(initialState);

  @override
  Stream<User> mapEventToState(int event) async* {
    try {
      User user = await User.getUserFromAPI(event);
      yield user;
    } catch (_) {}
  }
}
