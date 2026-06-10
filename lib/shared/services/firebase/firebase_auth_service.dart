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
  Future<Result<UserCredential, BaseException>>
  createAccountWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential = await _instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Ok(credential);
    } on FirebaseAuthException catch (ex) {
      return _handleAuthError<UserCredential>(ex);
    } catch (ex) {
      _logger.error(ex.toString());
      return Error(UnknownErrorException());
    }
  }

  @override
  Future<Result<UserCredential, BaseException>> signInWithGoogle() async {
    try {
      final res = await _instance.signInWithProvider(GoogleAuthProvider());
      return Ok(res);
    } on FirebaseAuthException catch (ex) {
      return _handleAuthError(ex);
    } catch (ex) {
      _logger.error("${UnknownErrorException().message}: ${ex.toString()}");
      return Error(UnknownErrorException());
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
      return _handleAuthError<UserCredential>(ex);
    } on Exception catch (ex) {
      _logger.error("${UnknownErrorException().message}: ${ex.toString()}");
      return Error(UnknownErrorException());
    }
  }

  @override
  Future<Result<bool, BaseException>> recoverPassword({
    required String email,
  }) async {
    try {
      await _instance.sendPasswordResetEmail(email: email);
      return Ok(true);
    } on FirebaseAuthException catch (ex) {
      return _handleAuthError<bool>(ex);
    } on Exception catch (ex) {
      _logger.error("${UnknownErrorException().message}: ${ex.toString()}");
      return Error(UnknownErrorException());
    }
  }

  @override
  FirebaseAuthStateListenable get stateListenable =>
      FirebaseAuthStateListenable();

  @override
  User? get currentUser => _instance.currentUser;

  Error<T, BaseException> _handleAuthError<T>(FirebaseAuthException ex) {
    switch (ex.code) {
      case "invalid-email" ||
          "wrong-password" ||
          "invalid-credential" ||
          "INVALID_LOGIN_CREDENTIALS" ||
          "auth/invalid-email":
        _logger.error(
          "${InvalidCredentialsException().message}: ${ex.toString()}",
        );
        return Error(InvalidCredentialsException());
      case 'weak-password':
        _logger.error('The password provided is too weak.');
        return Error(WeakPasswordException());
      case 'email-already-in-use':
        _logger.error('The account already exists for that email.');
        return Error(UserAlreadyExistsException());
      case "operation-not-allowed" ||
          "auth/missing-android-pkg-name" ||
          "auth/missing-continue-uri" ||
          "auth/missing-ios-bundle-id" ||
          "auth/unauthorized-continue-uri":
        _logger.error("${InternalErrorException().message}: ${ex.toString()}");
        return Error(InternalErrorException());
      case "user-not-found" || "auth/user-not-found":
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
      case "expired-action-code" || "invalid-action-code":
        _logger.error(
          "${InvalidActionCodeException().message}: ${ex.toString()}",
        );
        return Error(InvalidActionCodeException());
      default:
        _logger.error("${GenericAuthException().message}: ${ex.toString()}");
        return Error(GenericAuthException());
    }
  }
}
