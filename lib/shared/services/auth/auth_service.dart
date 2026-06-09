import 'package:adhd_app/shared/services/firebase/firebase_auth_listenable.dart';
import 'package:adhd_app/shared/utils/exceptions/auth/auth_exceptions.dart';
import 'package:adhd_app/shared/utils/exceptions/base_exception.dart';
import 'package:adhd_app/shared/utils/result/result.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<Result<UserCredential, BaseException>>
  createAccountWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Result<UserCredential, BaseException>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Result<void, AuthException>> signInWithCredentials({
    required AuthCredential credentials,
  });

  Future<Result<bool, BaseException>> recoverPassword({required String email});

  User? get currentUser;

  FirebaseAuthStateListenable get stateListenable;
}
