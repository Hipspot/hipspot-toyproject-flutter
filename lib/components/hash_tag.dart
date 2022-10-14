import 'package:flutter/material.dart';
import 'package:todo_list/model/hash_tag_model.dart';

class HashTag extends StatelessWidget {
  // final String hashtag;
  // final bool isSelectd;
  final HashTagModel hashTagModel;
  const HashTag({required this.hashTagModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(hashTagModel.hashTagName);
  }
}
