import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/dto/send_to_web_data.dart';
import 'package:todo_list/dto/send_to_web_message_type.dart';
import 'package:todo_list/model/transfer_message_model.dart';
import 'package:todo_list/type/tag_type.dart';

class AddTodoButton extends StatelessWidget {
  AddTodoButton({
    Key? key,
    required this.sendToWeb,
    required this.title,
    required this.isFilled,
    required this.tag,
    required this.type,
  }) : super(key: key);

  final String title;
  final bool isFilled;
  final TagType tag;
  final SendToWebMessageType type;
  final Function sendToWeb;
  int id = 0;
  @override
  Widget build(context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isFilled ? Colors.pink : Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        onPressed: () {
          if (isFilled) {
            TransferMessageModel todoData = id != 0
                ? TransferMessageModel(
                    type: describeEnum(type),
                    data: EditTodoData(
                      id: id,
                      title: title,
                      tag: describeEnum(tag),
                      content: '',
                    ))
                : TransferMessageModel(
                    type: describeEnum(type),
                    data: CreateTodoData(
                      title: title,
                      tag: describeEnum(tag),
                      content: '',
                    ));

            sendToWeb(todoData);
          } else {
            print("입력된 값이 없습니다");
          }
        },
        child: Text('추가하기'));
  }
}
