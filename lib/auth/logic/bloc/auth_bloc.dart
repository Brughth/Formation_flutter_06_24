import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formation_flutter_join24/auth/data/auth_service.dart';
import 'package:formation_flutter_join24/auth/data/user_model.dart';
import 'package:formation_flutter_join24/service_locator.dart';
import 'package:formation_flutter_join24/shared/cubit/application_cubit.dart';
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
        getIt.get<ApplicationCubit>().setUser(user);
        emit(RegisterSuccess(user: user));
      } on FirebaseAuthException catch (e) {
        emit(LoginFailure(message: e.code));
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
        getIt.get<ApplicationCubit>().setUser(user);
        emit(LoginSuccess(user: user));
      } on FirebaseAuthException catch (e) {
        emit(LoginFailure(message: e.code));
      } catch (e) {
        emit(LoginFailure(message: e.toString()));
      }
    });

    on<CheckAuthStateEvent>((event, emit) async {
      try {
        emit(CheckAuthStateLoading());
        var user = await repository.checkAuthState();
        if (user == null) {
          emit(CheckAuthStateFailure(message: ""));
          return;
        }
        getIt.get<ApplicationCubit>().setUser(user);
        emit(CheckAuthStateSuccess(user: user));
      } on FirebaseAuthException catch (e) {
        emit(CheckAuthStateFailure(message: e.code));
      } catch (e) {
        emit(CheckAuthStateFailure(message: e.toString()));
      }
    });
  }
}
