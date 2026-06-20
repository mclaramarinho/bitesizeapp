import 'package:adhd_app/shared/design_system/constants/ds_colors.dart';
import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/design_system/constants/ds_themes.dart';
import 'package:adhd_app/shared/services/providers/toast/toast_cubit.dart';
import 'package:adhd_app/shared/services/providers/toast/toast_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToastManager extends StatefulWidget {
  final Widget child;
  const ToastManager({required this.child, super.key});

  @override
  State<StatefulWidget> createState() => _ToastManagerState();
}

class _ToastManagerState extends State<ToastManager> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToastCubit, ToastState>(
      listener: (context, state) async {
        final cubit = context.read<ToastCubit>();
        final data = state.queue.firstOrNull;
        if (data == null) return;
        final controller = ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Wrap(
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.end,
              spacing: DsSpacing.md,
              children: [
                Icon(data.toastType.icon),
                Text(data.message, style: DsThemes.current.textTheme.bodyLarge),
              ],
            ),
            backgroundColor: data.toastType.color,
            persist: data.persist,
            padding: EdgeInsets.all(DsSpacing.sm),
            showCloseIcon: true,
            dismissDirection: DismissDirection.down,
            closeIconColor: DsColors.white.white,
          ),
        );
        if (!data.persist) {
          await Future.delayed(Duration(seconds: data.duration));
          controller.close();
        }
        controller.closed.then((_) {
          cubit.closeToast();
        });
      },
      builder: (context, state) => widget.child,
    );
  }
}
