import 'package:adhd_app/shared/utils/logger/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// TODO (docs)
extension ExtCubit on Cubit {
  static const _logger = Logger(location: "ExtCubit");
  void emitStateSafelly<T>(void Function(T) cb) {
    if (state is T) {
      cb(state as T);
    } else {
      _logger.error("Error emitting state safelly for $T.");
    }
  }
}
