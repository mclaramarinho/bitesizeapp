import 'package:adhd_app/features/auth/sign_in/domain/entities/sign_in_form_entity.dart';
import 'package:adhd_app/features/auth/sign_in/presentation/cubit/sign_in_state.dart';
import 'package:adhd_app/shared/services/auth/auth_service.dart';
import 'package:adhd_app/shared/utils/extensions/cubit.dart';
import 'package:adhd_app/shared/utils/extensions/string.dart';
import 'package:adhd_app/shared/utils/validators/input_validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required AuthService authService})
    : _authService = authService,
      super(SignInStateInitial());

  final AuthService _authService;

  bool isShowingRecoveryDialog = false;
  bool isRecoveryDialogValid = false;

  void load() {
    emit(SignInStateLoaded());
  }

  /// ============================================
  /// SETTERS
  /// ============================================
  void setEmail(String? email) {
    emitStateSafelly<SignInStateLoaded>(
      (st) => emit(
        st.copyWith(
          showError: false,
          showErrorInRecoveryDialog: false,
          formEntity: st.formEntity != null
              ? st.formEntity!.copyWith(email: email)
              : SignInFormEntity(email: email ?? "", password: ""),
        ),
      ),
    );
  }

  void setPassword(String? password) {
    emitStateSafelly<SignInStateLoaded>(
      (st) => emit(
        st.copyWith(
          showError: false,
          showErrorInRecoveryDialog: false,
          formEntity: st.formEntity != null
              ? st.formEntity!.copyWith(password: password)
              : SignInFormEntity(email: "", password: password ?? ""),
        ),
      ),
    );
  }

  void setShowRecoverPasswordDialog() {
    emitStateSafelly<SignInStateLoaded>(
      (st) => emit(
        st.copyWith(
          showErrorInRecoveryDialog: false,
          showRecoverPasswordDialog: !st.showRecoverPasswordDialog,
        ),
      ),
    );
  }

  void setRecoveryEmail(String? email) {
    final validation = InputValidation.validateEmail(email);
    final isValid = validation == null;
    emitStateSafelly<SignInStateLoaded>(
      (st) => emit(
        st.copyWith(
          recoveryDialogEmail: email,
          showErrorInRecoveryDialog: !isValid,
          recoveryDialogErrorMessage: validation,
          isRecoveryDialogButtonEnabled: isValid,
        ),
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
      email: form.email.trim(),
      password: form.password,
    );

    signInResult.when(
      ok: (_) {
        emit(SignInStateSuccess());
      },
      error: (ex) {
        _emitError(ex.message);
      },
    );
  }

  Future<void> signInWithGoogle() async {
    final createResult = await _authService.signInWithGoogle();
    createResult.when(
      ok: (val) {
        // TODO - create profile on the database if it does not exist yet
        emit(SignInStateSuccess());
      },
      error: (error) {
        _emitError(error.message);
      },
    );
  }

  /// ============================================
  /// RECOVER PASSWORD
  /// ============================================
  Future<void> sendRecoveryEmail() async {
    if (state is! SignInStateLoaded) return;
    final currentState = state as SignInStateLoaded;
    final email = currentState.recoveryDialogEmail;
    if (email.isNullOrEmpty()) return;
    final sendResult = await _authService.recoverPassword(
      email: currentState.recoveryDialogEmail!,
    );

    sendResult.when(
      ok: (_) => emit(SignInStateRecoveryEmailSent()),
      error: (ex) {
        emitStateSafelly<SignInStateLoaded>(
          (st) => emit(
            st.copyWith(
              showErrorInRecoveryDialog: true,
              recoveryDialogErrorMessage: ex.message,
            ),
          ),
        );
      },
    );
  }

  /// ============================================
  /// PRIVATE
  /// ============================================
  void _emitError(String message) {
    emitStateSafelly<SignInStateLoaded>(
      (st) => emit(st.copyWith(errorMessage: message, showError: true)),
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
