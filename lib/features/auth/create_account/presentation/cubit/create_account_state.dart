import 'package:adhd_app/features/auth/create_account/domain/entities/create_account_form_entity.dart';
import 'package:adhd_app/features/auth/create_account/domain/entities/create_account_form_steps_enum.dart';
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
  final CreateAccountSteps currentStep;
  final bool saveSuccessful;
  final bool isSigninWithGoogleOpen;

  CreateAccountStateLoaded({
    this.form = const CreateAccountFormEntity(),
    this.willSigninWithGoogle = false,
    this.isSaveLoading = false,
    this.currentStep = CreateAccountSteps.stepOne,
    this.saveSuccessful = false,
    this.isSigninWithGoogleOpen = false,
  });

  CreateAccountStateLoaded copyWith({
    CreateAccountFormEntity? form,
    bool? willSigninWithGoogle,
    bool? isSaveLoading,
    CreateAccountSteps? currentStep,
    bool? saveSuccessful,
    bool? isSigninWithGoogleOpen,
  }) {
    return CreateAccountStateLoaded(
      form: form ?? this.form,
      willSigninWithGoogle: willSigninWithGoogle ?? this.willSigninWithGoogle,
      isSaveLoading: isSaveLoading ?? this.isSaveLoading,
      currentStep: currentStep ?? this.currentStep,
      saveSuccessful: saveSuccessful ?? this.saveSuccessful,
      isSigninWithGoogleOpen: isSigninWithGoogleOpen ?? this.isSigninWithGoogleOpen,
    );
  }

  @override
  List<Object?> get props => [form, willSigninWithGoogle, isSaveLoading, currentStep, saveSuccessful, isSigninWithGoogleOpen];
}