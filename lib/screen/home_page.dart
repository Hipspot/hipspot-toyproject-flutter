import 'package:flutter/material.dart';
import 'package:todo_list/components/bottom_navigate_menu.dart';
import 'package:todo_list/components/web_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: TodoWebView()),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          _onButtonPressed();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _onButtonPressed() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true, // Set the BottomSheet to be expanded more
        builder: (context) {
          return Container(
            color: Color(0xff737373),
            height: MediaQuery.of(context).size.height *
                0.9, // Height of the phone * 0.9
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context)
                      .canvasColor, // The default color of MaterialType.canvas material
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: BuildBottomNavigationMenu(),
            ),
          );
        });
  }
}
