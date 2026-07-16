import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/design_system/constants/ds_themes.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_chat/entities/chat_message_entity.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_text/ds_text.dart';
import 'package:flutter/material.dart';

class DsMessageBubble extends StatelessWidget {
  final ChatMessageEntity message;

  const DsMessageBubble({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    final isMe = message.isSenderLoggedUser;

    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: isMe
          ? DsThemes.current.colorScheme.primary.withOpacity(0.15)
          : DsThemes.current.colorScheme.outline.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(DsSpacing.md),
          topRight: const Radius.circular(DsSpacing.md),
          bottomLeft: Radius.circular(isMe ? DsSpacing.md : 0),
          bottomRight: Radius.circular(isMe ? 0 : DsSpacing.md),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: DsSpacing.sm,
          horizontal: DsSpacing.md,
        ),
        child: DsText(message.message),
      ),
    );
  }
}
