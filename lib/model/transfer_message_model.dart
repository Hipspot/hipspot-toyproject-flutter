import 'package:todo_list/dto/send_to_web_data.dart';
import 'package:todo_list/dto/send_to_web_message_type.dart';

class TransferMessageModel {
  final String type;
  final dynamic data;
  TransferMessageModel({required this.type, required this.data});

  Map<String, dynamic> toMap() {
    return {
      'type': getQuote(type),
      'data': {
        'title': getQuote(data.title),
        'tag': getQuote(data.tag),
        'content': getQuote("")
      }
    };
  }

  String getQuote(str) {
    return '"$str"';
  }
}
