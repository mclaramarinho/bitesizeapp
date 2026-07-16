enum MessageResponseOption {
  none,
  text,
  multipleChoice,
  singleChoice,
  datePicker,
  timePicker,
  dateTimePicker,
}

class MessageResponseOptionDataEntity {
  final String label;
  final String id;

  MessageResponseOptionDataEntity({required this.label, required this.id});
}
