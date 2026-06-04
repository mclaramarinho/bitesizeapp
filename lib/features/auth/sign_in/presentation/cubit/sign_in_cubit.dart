import 'package:adhd_app/features/auth/sign_in/presentation/cubit/sign_in_state.dart';
import 'package:adhd_app/shared/services/auth/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  SignInCubit({
    required AuthService authService
  }) : _authService = authService,
       super(SignInStateInitial());

  final AuthService _authService;
}