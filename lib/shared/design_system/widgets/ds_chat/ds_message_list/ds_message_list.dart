import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_chat/ds_message_bubble/ds_message_bubble.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_chat/entities/chat_message_entity.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_image/ds_image.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_text/ds_text.dart';
import 'package:adhd_app/shared/utils/extensions/datetime.dart';
import 'package:flutter/material.dart';

class DsMessageList extends StatelessWidget {
  final List<ChatMessageEntity> messages;

  const DsMessageList({required this.messages, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: DsSpacing.sm),
        physics: const BouncingScrollPhysics(),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          final isMe = message.isSenderLoggedUser;

          final image = SizedBox(
            width: 40,
            height: 40,
            child: ClipOval(
              child: DsImage(
                sourceType: ImageSourceType.base64,
                source: message.senderPicture,
              ),
            ),
          );

          return ListTile(
            contentPadding: EdgeInsets.symmetric(
              vertical: DsSpacing.sm,
              horizontal: DsSpacing.sm,
            ),
            leading: isMe ? null : image,
            trailing: !isMe ? null : image,
            title: DsText(
              message.senderName,
              level: DsTextLevel.headerSmall,
              customTextStyle: CustomTextStyle(
                textAlign: isMe ? TextAlign.end : TextAlign.start,
              ),
            ),
            subtitle: Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: isMe
                  ? WrapCrossAlignment.end
                  : WrapCrossAlignment.start,
              runAlignment: isMe ? WrapAlignment.end : WrapAlignment.start,
              spacing: DsSpacing.sm,
              children: [
                Container(
                  padding: EdgeInsets.only(top: DsSpacing.sm),
                  child: DsMessageBubble(message: message),
                ),
                DsText(message.timestamp.toDateTimeString()),
              ],
            ),
            isThreeLine: true,
          );
        },
      ),
    );
  }
}
