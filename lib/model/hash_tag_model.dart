import 'package:todo_list/type/tag_type.dart';

class HashTagModel {
  final String tagViewText;
  final TagType tagType;
  bool isSelected;
  HashTagModel(
      {required this.tagViewText,
      required this.tagType,
      required this.isSelected});
}
