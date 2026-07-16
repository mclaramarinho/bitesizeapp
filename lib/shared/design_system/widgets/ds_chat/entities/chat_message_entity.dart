import 'package:adhd_app/shared/design_system/widgets/ds_chat/entities/message_response_option.dart';

class ChatMessageEntity {
  final String message;
  final String senderName;
  final String senderPicture;
  final DateTime timestamp;
  final String messageId;
  final MessageResponseOption responseOption;
  final List<MessageResponseOptionDataEntity>? responseOptions;
  final bool isSenderLoggedUser;
  final bool isChatEnded;

  ChatMessageEntity({
    required this.message,
    required this.senderName,
    required this.senderPicture,
    required this.timestamp,
    required this.messageId,
    required this.isSenderLoggedUser,
    this.responseOption = MessageResponseOption.none,
    this.isChatEnded = false,
    this.responseOptions,
  });
}
