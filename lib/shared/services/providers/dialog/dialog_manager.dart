import 'package:adhd_app/shared/di/injection.dart';
import 'package:adhd_app/shared/services/providers/dialog/dialog_cubit.dart';
import 'package:adhd_app/shared/services/providers/dialog/dialog_state.dart';
import 'package:adhd_app/shared/utils/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_dialog/ds_dialog.dart';

class DialogManager extends StatefulWidget {
  final Widget child;

  const DialogManager({super.key, required this.child});

  @override
  State<DialogManager> createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  bool _isShowingDialog = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DialogCubit, DialogState>(
      listener: (context, state) {
        final nextDialog = state.currentDialog;

        // Trigger a dialog draw ONLY if there's an item waiting AND
        // the engine isn't already rendering an open modal box.
        if (nextDialog != null && !_isShowingDialog) {
          _showNextDialog(context, nextDialog);
        }
      },
      child: widget.child,
    );
  }

  void _showNextDialog(BuildContext context, DialogRequest request) async {
    setState(() => _isShowingDialog = true);

    // Render using your structural design system dialog module
    DsDialog.show(
      getIt.get<AppRouter>().context,
      title: request.title,
      subtitle: request.subtitle,
      bodyBuilder: request.builder,
      onClosed: () {
        // Once the underlying navigator completes route dismissal:
        setState(() => _isShowingDialog = false);

        // Alert the Cubit to drop the resolved task and check for waiting requests
        if (mounted) {
          context.read<DialogCubit>().dismissCurrent();
        }
      },
    );
  }
}
