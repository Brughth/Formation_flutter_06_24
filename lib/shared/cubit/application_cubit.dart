import 'package:bloc/bloc.dart';
import 'package:formation_flutter_join24/auth/data/user_model.dart';
import 'package:meta/meta.dart';

part 'application_state.dart';

class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit() : super(const ApplicationState());
  setUser(UserModel user) {
    emit(ApplicationState(user: user));
  }
}
