import 'package:flutter/material.dart';

class AddTodoButton extends StatelessWidget {
  AddTodoButton(
      {Key? key,
      required this.text,
      required this.isFilled,
      required this.hashTags})
      : super(key: key);
  final String text;
  final bool isFilled;
  final List<String> hashTags;

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
            print(text);
            print(hashTags);
          } else {
            print("입력된 값이 없습니다");
          }
        },
        child: Text('추가하기'));
  }
}
