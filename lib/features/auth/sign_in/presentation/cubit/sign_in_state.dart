import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {}

class SignInStateInitial extends SignInState {
  SignInStateInitial();

  @override
  List<Object?> get props => [];
}

class SignInStateLoaded extends SignInState {
  SignInStateLoaded();
  
  @override
  List<Object?> get props => [];
}