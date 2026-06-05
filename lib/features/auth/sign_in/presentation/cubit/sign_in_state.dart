import 'package:adhd_app/features/auth/sign_in/domain/entities/sign_in_form_entity.dart';
import 'package:equatable/equatable.dart';

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

  SignInStateLoaded({
    this.formEntity,
    this.errorMessage,
    this.showError = false,
  });

  SignInStateLoaded copyWith({
    SignInFormEntity? formEntity,
    String? errorMessage,
    bool? showError,
  }) {
    return SignInStateLoaded(
      formEntity: formEntity ?? this.formEntity,
      errorMessage: errorMessage ?? this.errorMessage,
      showError: showError ?? this.showError,
    );
  }

  @override
  List<Object?> get props => [formEntity, errorMessage, showError];
}

class SignInStateSuccess extends SignInState {
  SignInStateSuccess();

  @override
  List<Object?> get props => [];
}
