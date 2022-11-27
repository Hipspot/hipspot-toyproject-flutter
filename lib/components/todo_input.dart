import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/components/add_todo_button.dart';
import 'package:todo_list/components/hash_tag_button_list.dart';
import 'package:todo_list/dto/send_to_web_message_type.dart';
import 'package:todo_list/model/hash_tag_model.dart';
import 'package:todo_list/type/tag_type.dart';

class TodoInput extends StatefulWidget {
  final Function sendToWeb;
  const TodoInput({Key? key, required this.sendToWeb}) : super(key: key);

  @override
  State<TodoInput> createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
  bool _isFilled = false;
  TagType _selectedTag = TagType.pm;
  final _inputController = TextEditingController();

  final List<HashTagModel> _hashTagState = [
    HashTagModel(tagViewText: "#기획", isSelected: true, tagType: TagType.pm),
    HashTagModel(
        tagViewText: "#디자인", isSelected: false, tagType: TagType.design),
    HashTagModel(tagViewText: "#BE", isSelected: false, tagType: TagType.be),
    HashTagModel(tagViewText: "#FE", isSelected: false, tagType: TagType.fe),
    HashTagModel(
        tagViewText: "#모바일", isSelected: false, tagType: TagType.mobile),
  ];

  void setSelectedTag(tag) => {
        setState(() {
          _selectedTag = tag;
          _hashTagState
              .where((tagState) => tag == tagState.tagType
                  ? tagState.isSelected = true
                  : tagState.isSelected = false)
              .toList();
        }),
      };

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HashTagButtonList(
              hashTagState: _hashTagState,
              selectedTag: _selectedTag,
              setSelectedTag: setSelectedTag),
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
                          title: _inputController.text,
                          isFilled: _isFilled,
                          tag: _selectedTag, //나중에 해시태그값 전달해주어야함
                          sendToWeb: widget.sendToWeb,
                          type: SendToWebMessageType.createTodo)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
