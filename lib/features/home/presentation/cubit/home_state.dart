import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class HomeState extends Equatable {}

class HomeStateInitial extends HomeState {
  HomeStateInitial();

  @override
  List<Object?> get props => [];
}

class HomeStateLoaded extends HomeState {
  HomeStateLoaded({required this.user});

  final User? user;

  HomeStateLoaded copyWith({User? user}) {
    return HomeStateLoaded(user: user);
  }

  @override
  List<Object?> get props => [user];
}
