import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/design_system/constants/ds_themes.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_button/ds_button.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_chat/entities/message_response_option.dart';
import 'package:flutter/material.dart';

class DsButtonReply extends StatelessWidget {
  final List<MessageResponseOptionDataEntity> options;
  final void Function(String)? onTap;

  const DsButtonReply({required this.options, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.all(DsSpacing.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(DsSpacing.md)),
        color: DsThemes.current.focusColor,
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.35,
      ),

      child: ListView.separated(
        shrinkWrap: true,
        itemCount: options.length,
        separatorBuilder: (context, index) =>
            SizedBox(height: index < options.length - 1 ? DsSpacing.md : 0),
        itemBuilder: (context, index) {
          final option = options[index];
          return Row(
            children: [
              Expanded(
                child: DsButton.loadable(
                  onPressed: () => onTap?.call(option.id),
                  label: option.label,
                  loadingLabel: "",
                  backgroundColor: DsThemes.current.colorScheme.primary
                      .withOpacity(0.15),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
