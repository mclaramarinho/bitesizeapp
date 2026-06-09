import 'package:adhd_app/shared/design_system/constants/ds_themes.dart';
import 'package:adhd_app/shared/di/injection.dart';
import 'package:adhd_app/shared/firebase/firebase_initializer.dart'
    as FirebaseInitializer;
import 'package:adhd_app/shared/services/env/env_service.dart';
import 'package:adhd_app/shared/services/providers/dialog/dialog_cubit.dart';
import 'package:adhd_app/shared/services/providers/dialog/dialog_manager.dart';
import 'package:adhd_app/shared/utils/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  /// DI
  configureDependencies();

  /// Load env variables
  await getIt.get<EnvService>().load();

  /// Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseInitializer.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => getIt.get<DialogCubit>())],
      child: MaterialApp.router(
        theme: DsThemes.freeDark,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en')],
        routerConfig: getIt.get<AppRouter>().router,
        builder: (context, child) {
          return DialogManager(child: child!);
        },
      ),
    );
  }
}
