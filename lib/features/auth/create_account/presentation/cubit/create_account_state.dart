import 'package:adhd_app/features/auth/create_account/domain/entities/create_account_form_entity.dart';
import 'package:equatable/equatable.dart';

abstract class CreateAccountState extends Equatable {}

class CreateAccountStateInitial extends CreateAccountState {
  @override
  List<Object?> get props => [];
}

class CreateAccountStateLoaded extends CreateAccountState {
  final CreateAccountFormEntity form;
  final bool willSigninWithGoogle;
  final bool isSaveLoading;
  final bool saveSuccessful;
  final bool isSigninWithGoogleOpen;
  final String? formErrorMessage;
  final bool showFormErrorMessage;

  CreateAccountStateLoaded({
    this.form = const CreateAccountFormEntity(),
    this.willSigninWithGoogle = false,
    this.isSaveLoading = false,
    this.saveSuccessful = false,
    this.isSigninWithGoogleOpen = false,
    this.formErrorMessage,
    this.showFormErrorMessage = false,
  });

  CreateAccountStateLoaded copyWith({
    CreateAccountFormEntity? form,
    bool? willSigninWithGoogle,
    bool? isSaveLoading,
    bool? saveSuccessful,
    bool? isSigninWithGoogleOpen,
    String? formErrorMessage,
    bool? showFormErrorMessage,
  }) {
    return CreateAccountStateLoaded(
      form: form ?? this.form,
      willSigninWithGoogle: willSigninWithGoogle ?? this.willSigninWithGoogle,
      isSaveLoading: isSaveLoading ?? this.isSaveLoading,
      saveSuccessful: saveSuccessful ?? this.saveSuccessful,
      isSigninWithGoogleOpen:
          isSigninWithGoogleOpen ?? this.isSigninWithGoogleOpen,
      formErrorMessage: formErrorMessage ?? this.formErrorMessage,
      showFormErrorMessage: showFormErrorMessage ?? this.showFormErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
    form,
    willSigninWithGoogle,
    isSaveLoading,
    saveSuccessful,
    isSigninWithGoogleOpen,
    formErrorMessage,
    showFormErrorMessage,
  ];
}

class CreateAccountStateSuccess extends CreateAccountState {
  @override
  List<Object?> get props => [];
}