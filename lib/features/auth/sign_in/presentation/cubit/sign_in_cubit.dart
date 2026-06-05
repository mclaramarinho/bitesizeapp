import 'package:adhd_app/features/auth/sign_in/domain/entities/sign_in_form_entity.dart';
import 'package:adhd_app/features/auth/sign_in/presentation/cubit/sign_in_state.dart';
import 'package:adhd_app/shared/services/auth/auth_service.dart';
import 'package:adhd_app/shared/utils/extensions/cubit.dart';
import 'package:adhd_app/shared/utils/extensions/string.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required AuthService authService})
    : _authService = authService,
      super(SignInStateInitial());

  final AuthService _authService;

  void load() {
    emit(SignInStateLoaded());
  }

  /// ============================================
  /// SETTERS
  /// ============================================

  void setEmail(String? email) {
    emitStateSafelly<SignInStateLoaded>(
      (st) => st.copyWith(
        showError: false,
        formEntity: st.formEntity != null
            ? st.formEntity!.copyWith(email: email)
            : SignInFormEntity(email: email ?? "", password: ""),
      ),
    );
  }

  void setPassword(String? password) {
    emitStateSafelly<SignInStateLoaded>(
      (st) => st.copyWith(
        showError: false,
        formEntity: st.formEntity != null
            ? st.formEntity!.copyWith(password: password)
            : SignInFormEntity(email: "", password: password ?? ""),
      ),
    );
  }

  /// ============================================
  /// SIGN IN
  /// ============================================
  Future<void> submit() async {
    if (!_validateForm()) return;

    final form = (state as SignInStateLoaded).formEntity!;

    final signInResult = await _authService.signInWithEmailAndPassword(
      email: form.email,
      password: form.password,
    );

    signInResult.when(
      ok: (val) {
        emit(SignInStateSuccess());
      },
      error: (ex) {
        _emitError(ex.message);
      },
    );
  }

  /// ============================================
  /// PRIVATE
  /// ============================================
  void _emitError(String message) {
    emitStateSafelly<SignInStateLoaded>(
      (st) => st.copyWith(errorMessage: message, showError: true),
    );
  }

  // TODO - localize messages
  bool _validateForm() {
    if (state is! SignInStateLoaded) return false;
    final form = (state as SignInStateLoaded).formEntity;
    if (form == null ||
        (form.email.isNullOrEmpty() && form.password.isNullOrEmpty())) {
      _emitError("All fields must be filled.");
      return false;
    }

    if (form.email.isNullOrEmpty()) {
      _emitError("Email cannot be blank.");
      return false;
    }

    if (form.password.isNullOrEmpty()) {
      _emitError("Password cannot be blank.");
      return false;
    }

    return true;
  }
}
