import 'package:equatable/equatable.dart';

abstract class CompleteProfileState extends Equatable {}

class CompleteProfileStateInitial extends CompleteProfileState {
  @override
  List<Object?> get props => [];
}

class CompleteProfileStateLoaded extends CompleteProfileState {
  CompleteProfileStateLoaded();

  @override
  List<Object?> get props => [];
}