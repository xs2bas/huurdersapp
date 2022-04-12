import 'dart:convert';

List<Email> emailFromJson(String str) =>
    List<Email>.from(json.decode(str).map((x) => Email.fromJson(x)));

String emailToJson(List<Email> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Email {
  Email({
    required this.date,
    required this.subject,
    required this.fromName,
    required this.message,
  });

  factory Email.fromJson(Map<String, dynamic> json) => Email(
        date: json["date"],
        subject: json["subject"],
        fromName: json["from_name"],
        message: json["message"],
      );

  String date;
  String fromName;
  String message;
  String subject;

  Map<String, dynamic> toJson() => {
        "date": date,
        "subject": subject,
        "from_name": fromName,
        "message": message,
      };
}
