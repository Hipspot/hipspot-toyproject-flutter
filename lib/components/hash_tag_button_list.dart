import 'package:flutter/material.dart';
import 'package:todo_list/model/hash_tag_model.dart';
import 'package:todo_list/type/tag_type.dart';
import 'package:todo_list/utils/getColor.dart';

class HashTagButtonList extends StatefulWidget {
  final TagType selectedTag;
  final Function setSelectedTag;
  final List<HashTagModel> hashTagState;
  HashTagButtonList(
      {Key? key,
      required this.selectedTag,
      required this.setSelectedTag,
      required this.hashTagState})
      : super(key: key);

  @override
  State<HashTagButtonList> createState() => _HashtagButtonListState();
}

class _HashtagButtonListState extends State<HashTagButtonList> {
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
                    for (var item in widget.hashTagState)
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                          child: HashtagButton(
                              tagViewText: item.tagViewText,
                              tagType: item.tagType,
                              isSelected: item.isSelected,
                              setSelectedTag: widget.setSelectedTag))
                  ],
                ),
              ],
            )),
      ],
    );
  }
}

// Hashtag Button
class HashtagButton extends StatelessWidget {
  final String tagViewText;
  final TagType tagType;
  final Function setSelectedTag;
  final bool isSelected;
  HashtagButton(
      {Key? key,
      required this.tagViewText,
      required this.setSelectedTag,
      required this.isSelected,
      required this.tagType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
            overlayColor: getColor(Colors.grey, Colors.pink),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0))),
            side: MaterialStateProperty.all(BorderSide(
                color: isSelected ? Color(0xffE44269) : Color(0xffCCCCCC)))),
        onPressed: () {
          setSelectedTag(tagType);
        },
        child: Text(
          tagViewText, // Getting parameters from HashtagState class
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? Color(0xffE44269) : Color(0xffCCCCCC),
          ),
        ));
  }
}
