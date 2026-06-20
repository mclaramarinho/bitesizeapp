import 'dart:ui';

import 'package:adhd_app/shared/design_system/constants/ds_colors.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum ToastType {
  info(icon: Icons.info),
  warning(icon: Icons.warning),
  error(icon: Icons.error),
  success(icon: Icons.check);

  final IconData icon;
  const ToastType({required this.icon});

  Color? get color {
    switch (this) {
      case ToastType.success:
        return DsColors.green.success;
      case ToastType.error:
        return DsColors.red.error;
      case ToastType.warning:
        return DsColors.yellow.warning;
      case ToastType.info:
        return DsColors.blue.pure;
    }
  }
}

class ToastData {
  final String message;
  final int duration;
  final ToastType toastType;
  final String id;
  final bool persist;

  ToastData({
    required this.message,
    this.duration = 3,
    this.toastType = ToastType.info,
    this.persist = false,
  }) : id = Uuid().v4();
}

class ToastState extends Equatable {
  final List<ToastData> queue;

  const ToastState({this.queue = const []});

  ToastState copyWith({bool? isDbConnected, List<ToastData>? queue}) {
    return ToastState(queue: queue ?? this.queue);
  }

  @override
  List<Object?> get props => [queue];
}
