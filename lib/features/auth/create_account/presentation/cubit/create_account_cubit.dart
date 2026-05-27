import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'create_account_state.dart';

@injectable
class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(CreateAccountStateInitial());

  void load() {
    emit(CreateAccountStateLoaded());
  }

  // ========================================================================
  // NAVIGATION
  // ========================================================================
  void nextStep() {
    _emitLoadedStateSafelly(
      (cs) => emit(cs.copyWith(currentStep: cs.currentStep.next())),
    );
  }

  void previousStep() {
    _emitLoadedStateSafelly(
      (cs) => emit(cs.copyWith(currentStep: cs.currentStep.previous())),
    );
  }

  // ========================================================================
  // PRIVATE
  // ========================================================================
  void _emitLoadedStateSafelly(void Function(CreateAccountStateLoaded) cb) {
    if (state is CreateAccountStateLoaded) {
      final currentState = state as CreateAccountStateLoaded;
      cb(currentState);
    }
  }
}
