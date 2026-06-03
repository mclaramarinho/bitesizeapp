import 'package:adhd_app/shared/services/auth/auth_service.dart';
import 'package:adhd_app/shared/utils/exceptions/auth/auth_exceptions.dart';
import 'package:adhd_app/shared/utils/extensions/string.dart';
import 'package:adhd_app/shared/utils/result/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'create_account_state.dart';

@injectable
class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit({required AuthService authService})
    : _authService = authService,
      super(CreateAccountStateInitial());

  final AuthService _authService;

  void load() {
    emit(CreateAccountStateLoaded());
  }

  // ========================================================================
  // ACCOUNT CREATION LOGIC - STEP 1
  // ========================================================================
  Future<void> createWithEmailAndPassword() async {
    final canCreateAccount = _validateCanCreateAccount();

    if (canCreateAccount == null) {
      return;
    }

    final [validEmail, validPassword] = canCreateAccount;

    final Result<UserCredential, AuthException> createResult =
        await _authService.createAccountWithEmailAndPassword(
          email: validEmail,
          password: validPassword,
        );

    createResult.when(
      ok: (userCredential) {
        // Account created successfully, you can emit a success state or navigate to another page
        print('Account created successfully: ${userCredential.user?.email}');
        _emitLoadedStateSafelly(
          (cs) => emit(
            cs.copyWith(
              form: cs.form.copyWith(
                email: userCredential.user?.email,
                firebaseUserUid: userCredential.user?.uid,
              ),
              showFormErrorMessage: false,
            ),
          ),
        );
        // TODO - sign user in 
        emit(CreateAccountStateSuccess());
      },
      error: (error) {
        // Handle the error, you can emit an error state with the error message or show a snackbar
        print('Error creating account: $error');
        _emitFormErrorMessage(error.message);
      },
    );
  }

  // ========================================================================
  // SETTERS
  // ========================================================================
  void setEmail(String? email) {
    _emitLoadedStateSafelly(
      (cs) => emit(
        cs.copyWith(
          form: cs.form.copyWith(email: email),
          showFormErrorMessage: false,
        ),
      ),
    );
  }

  void setPassword(String? password) {
    _emitLoadedStateSafelly(
      (cs) => emit(
        cs.copyWith(
          form: cs.form.copyWith(password: password),
          showFormErrorMessage: false,
        ),
      ),
    );
  }

  void setConfirmPassword(String? confirmPassword) {
    _emitLoadedStateSafelly(
      (cs) => emit(
        cs.copyWith(
          form: cs.form.copyWith(confirmPassword: confirmPassword),
          showFormErrorMessage: false,
        ),
      ),
    );
  }

  // ========================================================================
  // PRIVATE
  // ========================================================================
  void _emitLoadedStateSafelly(void Function(CreateAccountStateLoaded) cb) {
    if (state is CreateAccountStateLoaded) {
      final currentState = state as CreateAccountStateLoaded;
      cb(currentState);
    }
  }

  void _emitFormErrorMessage(String message) {
    _emitLoadedStateSafelly(
      (cs) => emit(
        cs.copyWith(formErrorMessage: message, showFormErrorMessage: true),
      ),
    );
  }

  List<String>? _validateCanCreateAccount() {
    if (state is! CreateAccountStateLoaded) return null;

    final currentState = state as CreateAccountStateLoaded;
    final form = currentState.form;

    if (form.email.isNullOrEmpty() ||
        form.password.isNullOrEmpty() ||
        form.confirmPassword.isNullOrEmpty()) {
      _emitFormErrorMessage('Please fill in all fields');
      return null;
    }

    final [email, password, confirmPassword] = [
      form.email!,
      form.password!,
      form.confirmPassword!,
    ];

    if (password != confirmPassword) {
      _emitFormErrorMessage('Passwords do not match');
      return null;
    }
    return [email, password];
  }
}
