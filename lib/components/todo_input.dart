import 'package:flutter/material.dart';
import 'package:todo_list/components/add_todo_button.dart';

class TodoInput extends StatefulWidget {
  const TodoInput({Key? key}) : super(key: key);

  @override
  State<TodoInput> createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
  bool _isFilled = false;
  var _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
                  child: Text(
                    '할 일 입력',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff666666),
                    ),
                    textAlign: TextAlign.start,
                  )),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: TextField(
                    controller: _inputController,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink)),
                        hintText: '할 일을 입력해 주세요.',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 4),
                        hintStyle: TextStyle(
                          color: Color(0xffCCCCCC),
                          fontSize: 16,
                        )),
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          _isFilled = false;
                        } else {
                          _isFilled = true;
                        }
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      16, 0, 16, MediaQuery.of(context).viewInsets.bottom + 12),
                  child: SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: AddTodoButton(
                        text: _inputController.text,
                        isFilled: _isFilled,
                        hashTags: ["1", "2", "3"], //나중에 해시태그값 전달해주어야함
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
