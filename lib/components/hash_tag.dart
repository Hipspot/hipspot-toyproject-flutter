import 'package:flutter/material.dart';
import 'package:todo_list/utils/getColor.dart';

class HashTagButtonList extends StatefulWidget {
  final List<String> hashTagList;

  const HashTagButtonList({Key? key, required this.hashTagList})
      : super(key: key);

  @override
  State<HashTagButtonList> createState() =>
      _HashtagButtonListState(hashTagList: hashTagList);
}

class _HashtagButtonListState extends State<HashTagButtonList> {
  final List<String> hashTagList;

  _HashtagButtonListState({required this.hashTagList});
  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 25, 0, 0),
          child: SizedBox(
            width: 150,
            height: 20,
            child: Text(
              '해시태그 선택',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Color(0xff666666),
              ),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(20, 16, 0, 0),
            child: Column(
              children: [
                Wrap(
                  direction: Axis.horizontal, // 나열 방향
                  alignment: WrapAlignment.start, // 정렬 방식
                  spacing: 0, // 좌우 간격
                  runSpacing: 6, // 상하 간격
                  children: [
                    for (var item in hashTagList)
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                          child: HashtagButton(text: item))
                  ],
                ),
              ],
            )),
      ],
    );
  }
}

// Hashtag Button
class HashtagButton extends StatefulWidget {
  final String text;
  const HashtagButton({Key? key, required this.text}) : super(key: key);

  @override
  State<HashtagButton> createState() => _HashtagButtonState();
}

class _HashtagButtonState extends State<HashtagButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
            overlayColor: getColor(Colors.grey, Colors.pink),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0))),
            side: MaterialStateProperty.all(BorderSide(
                color: _isPressed ? Color(0xffE44269) : Color(0xffCCCCCC)))),
        onPressed: () {
          setState(() {
            _isPressed = !_isPressed;
          });
        },
        child: Text(
          widget.text, // Getting parameters from HashtagState class
          style: TextStyle(
            fontSize: 16,
            color: _isPressed ? Color(0xffE44269) : Color(0xffCCCCCC),
          ),
        ));
  }
}
