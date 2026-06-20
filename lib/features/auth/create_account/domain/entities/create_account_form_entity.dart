import 'package:equatable/equatable.dart';

class CreateAccountFormEntity extends Equatable {
  final String? email;
  final String? password;
  final String? confirmPassword;
  final String? name;
  final DateTime? birthdate;
  final String? country;
  final String? userUid;

  const CreateAccountFormEntity({
    this.email,
    this.password,
    this.confirmPassword,
    this.name,
    this.birthdate,
    this.country,
    this.userUid,
  });

  CreateAccountFormEntity copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    String? name,
    DateTime? birthdate,
    String? country,
    String? userUid,
  }) {
    return CreateAccountFormEntity(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      name: name ?? this.name,
      birthdate: birthdate ?? this.birthdate,
      country: country ?? this.country,
      userUid: userUid ?? this.userUid,
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
    confirmPassword,
    name,
    birthdate,
    country,
    userUid,
  ];
}
