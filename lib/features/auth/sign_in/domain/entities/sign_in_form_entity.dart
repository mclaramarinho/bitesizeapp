import 'package:equatable/equatable.dart';

class SignInFormEntity extends Equatable {
  final String email;
  final String password;

  const SignInFormEntity({required this.email, required this.password});

  SignInFormEntity copyWith({
    String? email,
    String? password
  }) => SignInFormEntity(email: email ?? this.email, password: password ?? this.password)

  @override
  List<Object?> get props => [email, password];
}
