import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DialogRequest extends Equatable {
  final WidgetBuilder builder;
  final String? title;
  final String? subtitle;
  final String id;
  final VoidCallback? onClose;

  const DialogRequest({
    required this.builder,
    required this.id,
    this.title,
    this.subtitle,
    this.onClose,
  });

  @override
  List<Object?> get props => [builder, id, title, subtitle, onClose];
}

class DialogState extends Equatable {
  final List<DialogRequest> queue;

  const DialogState({this.queue = const []});

  DialogRequest? get currentDialog => queue.isNotEmpty ? queue.first : null;

  DialogState copyWith({List<DialogRequest>? queue}) {
    return DialogState(queue: queue ?? this.queue);
  }

  @override
  List<Object?> get props => [queue];
}
