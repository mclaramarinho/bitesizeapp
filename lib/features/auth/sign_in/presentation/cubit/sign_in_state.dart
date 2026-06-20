import 'package:adhd_app/features/auth/sign_in/domain/entities/sign_in_form_entity.dart';
import 'package:equatable/equatable.dart';

// TODO (docs)
abstract class SignInState extends Equatable {}

class SignInStateInitial extends SignInState {
  SignInStateInitial();

  @override
  List<Object?> get props => [];
}

class SignInStateLoaded extends SignInState {
  final SignInFormEntity? formEntity;
  final String? errorMessage;
  final bool showError;
  final bool showRecoverPasswordDialog;
  final String? recoveryDialogEmail;
  final String? recoveryDialogErrorMessage;
  final bool showErrorInRecoveryDialog;
  final bool isRecoveryDialogButtonEnabled;

  SignInStateLoaded({
    this.formEntity,
    this.errorMessage,
    this.showError = false,
    this.showRecoverPasswordDialog = false,
    this.recoveryDialogEmail,
    this.recoveryDialogErrorMessage,
    this.showErrorInRecoveryDialog = false,
    this.isRecoveryDialogButtonEnabled = false,
  });

  SignInStateLoaded copyWith({
    SignInFormEntity? formEntity,
    String? errorMessage,
    bool? showError,
    bool? showRecoverPasswordDialog,
    String? recoveryDialogEmail,
    String? recoveryDialogErrorMessage,
    bool? showErrorInRecoveryDialog,
    bool? isRecoveryDialogButtonEnabled,
  }) {
    return SignInStateLoaded(
      formEntity: formEntity ?? this.formEntity,
      errorMessage: errorMessage ?? this.errorMessage,
      showError: showError ?? this.showError,
      showRecoverPasswordDialog:
          showRecoverPasswordDialog ?? this.showRecoverPasswordDialog,
      recoveryDialogEmail: recoveryDialogEmail ?? this.recoveryDialogEmail,
      recoveryDialogErrorMessage:
          recoveryDialogErrorMessage ?? this.recoveryDialogErrorMessage,
      showErrorInRecoveryDialog:
          showErrorInRecoveryDialog ?? this.showErrorInRecoveryDialog,
      isRecoveryDialogButtonEnabled:
          isRecoveryDialogButtonEnabled ?? this.isRecoveryDialogButtonEnabled,
    );
  }

  @override
  List<Object?> get props => [
    formEntity,
    errorMessage,
    showError,
    showRecoverPasswordDialog,
    recoveryDialogEmail,
    recoveryDialogErrorMessage,
    showErrorInRecoveryDialog,
    isRecoveryDialogButtonEnabled,
  ];
}

class SignInStateSuccess extends SignInState {
  SignInStateSuccess();

  @override
  List<Object?> get props => [];
}

class SignInStateRecoveryEmailSent extends SignInState {
  SignInStateRecoveryEmailSent();

  @override
  List<Object?> get props => [];
}
