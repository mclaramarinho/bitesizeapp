import 'package:adhd_app/shared/services/providers/dialog/dialog_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

// TODO (docs)
@injectable
class DialogCubit extends Cubit<DialogState> {
  DialogCubit() : super(DialogState());

  void queueDialog(DialogRequest dialogRequest) {
    final updatedQueue = List<DialogRequest>.from(state.queue)
      ..add(dialogRequest);
    emit(state.copyWith(queue: updatedQueue));
  }

  void dismissCurrent() {
    if (state.queue.isEmpty) return;

    final completedDialog = state.currentDialog;

    // Pop the front item from the queue list
    final updatedQueue = List<DialogRequest>.from(state.queue)..removeAt(0);
    emit(state.copyWith(queue: updatedQueue));

    // Trigger the original cubit property cleanup (e.g., setting showRecoverPasswordDialog to false)
    // AFTER updating the queue to prevent infinite lifecycle listener loops.
    completedDialog?.onClose?.call();
  }

  void removeById(String id) {
    if (state.queue.isEmpty) return;
    final updatedQueue = state.queue
        .map((item) => item.id != id)
        .toList()
        .cast<DialogRequest>();
    emit(state.copyWith(queue: updatedQueue));
  }
}
