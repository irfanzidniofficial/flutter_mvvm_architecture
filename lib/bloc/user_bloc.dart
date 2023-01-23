import 'package:bloc/bloc.dart';

import '../model/user.dart';

class UserBloc extends Bloc<int, User> {
  UserBloc(super.initialState);

  User get initialState => UnintializedUser();

  Stream<User> mapEventToState(int event) async* {
    try {
      User user = await User.getUserFromAPI(event);
      yield user;
    } catch (_) {}
  }

  void dispatch(int i) {}
}
