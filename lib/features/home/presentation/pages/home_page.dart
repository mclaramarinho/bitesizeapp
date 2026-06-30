import 'package:adhd_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:adhd_app/features/home/presentation/cubit/home_state.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_text/ds_text.dart';
import 'package:adhd_app/shared/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// TODO (localize)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<HomeCubit>()..load(),
      child: _HomePageContent(),
    );
  }
}

class _HomePageContent extends StatefulWidget {
  const _HomePageContent();

  @override
  State<StatefulWidget> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<_HomePageContent> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            if (state is HomeStateInitial) ...[CircularProgressIndicator()],

            if (state is HomeStateLoaded) ...[
              DsText("Welcome", level: DsTextLevel.headerLarge),
              DsText("Home page for user: ${state.user!.email}"),
            ],
          ],
        );
      },
    );
  }
}
