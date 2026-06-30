import 'package:adhd_app/features/home/presentation/cubit/home_state.dart';
import 'package:adhd_app/shared/services/auth/domain/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

// TODO (docs)
@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required AuthService authService})
    : _authService = authService,
      super(HomeStateInitial());

  final AuthService _authService;

  void load() {
    final User? user = _authService.currentUser;
    if (user != null) {
      emit(HomeStateLoaded(user: user));
    }
  }
}
