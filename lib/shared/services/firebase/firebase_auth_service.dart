import 'package:adhd_app/shared/services/auth/auth_service.dart';
import 'package:adhd_app/shared/utils/exceptions/auth/auth_exceptions.dart';
import 'package:adhd_app/shared/utils/result/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthService)
class FirebaseAuthService implements AuthService {
  static final FirebaseAuth _instance = FirebaseAuth.instance;
  @override
  Future<Result<UserCredential, AuthException>> createAccountWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential = await _instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Ok(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return Error(WeakPasswordException());
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return Error(UserAlreadyExistsException());
      }
      print('Unexpected error occurred: ${e.message}');
      return Error(GenericAuthException(e.message ?? 'An unexpected error occurred'));
    } catch (e) {
      print(e);
      return Error(GenericAuthException(e.toString()));
    }
  }
}
