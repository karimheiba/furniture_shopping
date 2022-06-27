import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shopping_app/data/model/user_data_model.dart';
import 'package:furniture_shopping_app/data/repositories/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  AuthBloc({required this.authRepo}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is CreateUserAuthEvent) {
        emit(AuthLoading());
        final newUser = await authRepo.createNewUser(
            event.email, event.password, event.name);

        newUser.fold((failure) => emit(AuthError(failure.message)),
            (user) => emit(AuthSuccess()));
      }

      if (event is LogInUserAuthEvent) {
        emit(AuthLoading());
        final user = await authRepo.logInUser(event.email, event.password);
        user.fold((failure) => emit(AuthError(failure.message)), (userLogin) {
          emit(AuthSuccess());
          emit(AuthGetUserData(userData: userLogin));
        });
      }
    });
  }
}