import 'package:bloc/bloc.dart';
import 'package:practice_ui_27/bloc/auth/auth_event.dart';
import 'package:practice_ui_27/bloc/auth/auth_state.dart';
import 'package:practice_ui_27/repository/user_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;

  AuthBloc({required this.userRepository}) : super(UnAuthenticated()) {
    on<SignInRequested>(_signIn);
    on<SignUpRequested>(_signUp);
    on<SignOutRequested>(_signOut);
  }

  void _signIn(SignInRequested event, Emitter<AuthState> emit) async {
    emit(Loading());
    try {
      await userRepository.signIn(email: event.email, password: event.password);
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  void _signUp(SignUpRequested event, Emitter<AuthState> emit) async {
    emit(Loading());
    try {
      await userRepository.signUp(email: event.email, password: event.password);
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  void _signOut(SignOutRequested event, Emitter<AuthState> emit) async {
    emit(Loading());
    try {
      await userRepository.signOut();
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }
}
