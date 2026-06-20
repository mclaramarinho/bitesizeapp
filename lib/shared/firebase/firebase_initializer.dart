import 'package:adhd_app/shared/firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

// TODO (docs)
// TODO (fix) - Use Result pattern
Future<void> init() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
