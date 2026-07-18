import 'package:adhd_app/shared/design_system/widgets/ds_chat/ds_button_reply/ds_button_reply.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_chat/ds_message_list/ds_message_list.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_chat/entities/chat_message_entity.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_chat/entities/message_response_option.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_text/ds_text.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_text_input/ds_text_input.dart';
import 'package:flutter/material.dart';

class DsChat extends StatefulWidget {
  final List<ChatMessageEntity> messages;
  final void Function(String)? onSend;
  final bool blockReplyOnSend;

  const DsChat({
    required this.messages,
    this.onSend,
    this.blockReplyOnSend = true,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _DsChatState();
}

class _DsChatState extends State<DsChat> {
  bool isReplyBlocked = true;
  bool hasRepliedLast = false;

  late ChatMessageEntity? lastMessage = widget.messages.lastOrNull;
  late MessageResponseOption? responseType = lastMessage?.responseOption;
  late List<MessageResponseOptionDataEntity>? options =
      lastMessage?.responseOptions;

  @override
  void initState() {
    super.initState();

    lastMessage = widget.messages.lastOrNull;
    responseType = lastMessage?.responseOption;
    options = lastMessage?.responseOptions;

    if (responseType != .none) {
      isReplyBlocked = false;
    }
  }

  void onReply(String? val) {
    if (val == null) return;

    widget.onSend?.call(val);

    setState(() {
      hasRepliedLast = true;
      isReplyBlocked = true;
    });
  }

  Widget getResponseWidget() {
    if (lastMessage == null || responseType == .none || isReplyBlocked) {
      return DsText("Sorry :( You can't reply just yet", level: .bodyLarge);
    }

    if (lastMessage!.isChatEnded) {
      return DsText("This chat has ended", level: .bodyLarge);
    }

    switch (responseType) {
      case .text:
        return DsTextInput(
          hint: "Enter your message here",
          customSuffix: Icons.send,
          onTapCustomSuffix: onReply,
        );

      case .singleChoice:
        return DsButtonReply(options: options!, onTap: onReply);

      default:
        return DsText("This reply option is still not available");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DsMessageList(messages: widget.messages),

        getResponseWidget()
      ],
    );
  }
}
