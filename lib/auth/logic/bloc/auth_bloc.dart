import 'package:bloc/bloc.dart';
import 'package:formation_flutter_join24/auth/data/auth_service.dart';
import 'package:formation_flutter_join24/auth/data/user_model.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  var repository = AuthService();
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>((event, emit) async {
      try {
        emit(RegisterLoading());
        var user = await repository.register(
          email: event.email,
          password: event.password,
          firstName: event.firstName,
          lastName: event.lastName,
          phoneNumber: event.phoneNumber,
        );
        emit(RegisterSuccess(user: user));
      } catch (e) {
        emit(RegisterFailure(message: e.toString()));
      }
    });
    on<LoginEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        var user = await repository.login(
          email: event.email,
          password: event.password,
        );
        emit(LoginSuccess(user: user));
      } catch (e) {
        emit(LoginFailure(message: e.toString()));
      }
    });
  }
}
