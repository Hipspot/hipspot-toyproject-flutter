import 'package:flutter/material.dart';
import 'package:todo_list/components/todo_input.dart';
import 'package:todo_list/utils/getToday.dart';

class BuildBottomNavigationMenu extends StatelessWidget {
  final Function sendToWeb;
  BuildBottomNavigationMenu({Key? key, required this.sendToWeb})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BottomNavigationTitle(
          titleName: "TODO 추가",
        ),
        Divider(
          // The line
          thickness: 1,
          color: Color(0xffF2F2F2),
        ),
        TodoInput(sendToWeb: sendToWeb),
      ],
    );
  }
}

class BottomNavigationTitle extends StatelessWidget {
  final String titleName;

  BottomNavigationTitle({Key? key, required this.titleName}) : super(key: key);

  @override
  Widget build(context) {
    return Row(
      // The first two lines with X icon
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          // The first two lines
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: SizedBox(
                width: 70,
                height: 20,
                child: Text(
                  'TODO 추가',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xff999999),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
              child: SizedBox(
                width: 150,
                height: 20,
                child: Text(
                  getToday(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xff1A1A1A),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
            // X icon which works to close the bottom sheet
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close),
              color: Color(0xff999999),
            )),
      ],
    );
  }
}
