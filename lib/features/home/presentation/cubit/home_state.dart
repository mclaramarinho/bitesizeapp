import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {}

class HomeStateInitial extends HomeState {
  HomeStateInitial();

  @override
  List<Object?> get props => [];
}

class HomeStateLoaded extends HomeState {
  HomeStateLoaded();

  @override
  List<Object?> get props => [];
}
