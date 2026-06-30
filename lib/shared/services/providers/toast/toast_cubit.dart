import 'package:adhd_app/shared/services/network/connectivity/domain/connectivity_service.dart';
import 'package:adhd_app/shared/services/providers/toast/toast_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

// TODO (docs)
@injectable
class ToastCubit extends Cubit<ToastState> {
  ToastCubit({required ConnectivityService connectivityService})
    : _connectivityService = connectivityService,
      super(ToastState());

  final ConnectivityService _connectivityService;

  bool? wasConnected = false;

  void listen() {
    _connectivityService.onConnectivityChanged.listen((isOnline) {
      if (isOnline == null) return;
      _add(isOnline ? _dbConnected : _dbDisconnected);
    });
  }

  void closeToast() {
    var currentQueue = List.from(state.queue);
    currentQueue.removeAt(0);
    _emitQueue(currentQueue.cast<ToastData>());
  }

  void _removeById(String id) {
    var currentQueue = state.queue;
    currentQueue.removeWhere((t) => t.id == id);
    _emitQueue(currentQueue);
  }

  void _add(ToastData data) {
    var currentQueue = [...List.from(state.queue), data];
    _emitQueue(currentQueue.cast<ToastData>());
  }

  void _emitQueue(List<ToastData> currentQueue) {
    emit(state.copyWith(queue: currentQueue));
  }

  final ToastData _dbDisconnected = ToastData(
    message: "You are offline",
    toastType: ToastType.error,
  );
  final ToastData _dbConnected = ToastData(
    message: "You are back online",
    toastType: ToastType.success,
  );
}
