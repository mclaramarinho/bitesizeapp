import 'package:adhd_app/shared/services/auth/dto/auth_credential_dto.dart';
import 'package:adhd_app/shared/services/firebase/firebase_auth_listenable.dart';
import 'package:adhd_app/shared/utils/exceptions/base_exception.dart';
import 'package:adhd_app/shared/utils/result/result.dart';
import 'package:firebase_auth/firebase_auth.dart';

// TODO (docs)
abstract class AuthService {
  Future<Result<AuthCredentialDto, BaseException>>
  createAccountWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Result<AuthCredentialDto, BaseException>> signInWithGoogle();

  Future<Result<AuthCredentialDto, BaseException>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Result<bool, BaseException>> recoverPassword({required String email});

  User? get currentUser;

  FirebaseAuthStateListenable get stateListenable;
}
