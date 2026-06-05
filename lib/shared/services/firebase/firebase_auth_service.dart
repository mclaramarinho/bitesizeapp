import 'package:adhd_app/shared/services/auth/auth_service.dart';
import 'package:adhd_app/shared/services/firebase/firebase_auth_listenable.dart';
import 'package:adhd_app/shared/utils/exceptions/app/app_exception.dart';
import 'package:adhd_app/shared/utils/exceptions/auth/auth_exceptions.dart';
import 'package:adhd_app/shared/utils/exceptions/base_exception.dart';
import 'package:adhd_app/shared/utils/exceptions/network/network_exception.dart';
import 'package:adhd_app/shared/utils/logger/logger.dart';
import 'package:adhd_app/shared/utils/result/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthService)
class FirebaseAuthService implements AuthService {
  static final FirebaseAuth _instance = FirebaseAuth.instance;

  static final _logger = Logger(location: "FirebaseAuthService");
  @override
  Future<Result<UserCredential, AuthException>>
  createAccountWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential = await _instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Ok(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _logger.error('The password provided is too weak.');
        return Error(WeakPasswordException());
      } else if (e.code == 'email-already-in-use') {
        _logger.error('The account already exists for that email.');
        return Error(UserAlreadyExistsException());
      }
      _logger.error('Unexpected error occurred: ${e.message}');
      return Error(GenericAuthException());
    } catch (e) {
      _logger.error(e.toString());
      return Error(GenericAuthException());
    }
  }

  @override
  Future<Result<UserCredential, BaseException>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final authResult = await _instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Ok(authResult);
    } on FirebaseAuthException catch (ex) {
      switch (ex.code) {
        case "invalid-email" ||
            "wrong-password" ||
            "invalid-credential" ||
            "INVALID_LOGIN_CREDENTIALS":
          _logger.error(
            "${InvalidCredentialsException().message}: ${ex.toString()}",
          );
          return Error(InvalidCredentialsException());
        case "operation-not-allowed":
          _logger.error(
            "${InternalErrorException().message}: ${ex.toString()}",
          );
          return Error(InternalErrorException());
        case "user-not-found":
          _logger.error(
            "${UserDoesNotExistException().message}: ${ex.toString()}",
          );
          return Error(UserDoesNotExistException());
        case "user-disabled":
          _logger.error("${UserDisabledException().message}: ${ex.toString()}");
          return Error(UserDisabledException());
        case "network-request-failed":
          _logger.error(
            "${NetworkRequestFailedException().message}: ${ex.toString()}",
          );
          return Error(NetworkRequestFailedException());
        case "too-many-requests":
          _logger.error(
            "${TooManyRequestsException().message}: ${ex.toString()}",
          );
          return Error(TooManyRequestsException());
        default:
          _logger.error("${GenericAuthException().message}: ${ex.toString()}");
          return Error(GenericAuthException());
      }
    } on Exception catch (ex) {
      _logger.error("${GenericAuthException().message}: ${ex.toString()}");
      return Error(GenericAuthException());
    }
  }

  @override
  Future<Result<void, AuthException>> signInWithCredentials({
    required AuthCredential credentials,
  }) async {
    // TODO: implement signInWithCredentials
    throw UnimplementedError();
  }

  @override
  FirebaseAuthStateListenable get stateListenable =>
      FirebaseAuthStateListenable();

  @override
  User? get currentUser => _instance.currentUser;
}
