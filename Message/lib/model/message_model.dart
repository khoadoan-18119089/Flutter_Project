class MessageModel {
  final String messageText;
  final String sendBy;
  final String type;
  final String id;
  final String timerHHMM;
  final String timerMMDDYYYY;
  MessageModel(
      {required this.id,
      required this.messageText,
      required this.sendBy,
      required this.type,
      required this.timerHHMM,
      required this.timerMMDDYYYY});
  factory MessageModel.formJson(Map<String, dynamic> json) {
    return MessageModel(
        id: json['id'],
        messageText: json['messageText'],
        sendBy: json['sendBy'],
        type: json['type'],
        timerHHMM: json['timerHHMM'],
        timerMMDDYYYY: json['timerMMDDYYYY']);
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'messageText': messageText,
        'sendBy': sendBy,
        'type': type,
        'timerHHMM': timerHHMM,
        'timerMMDDYYYY': timerMMDDYYYY
      };
}
