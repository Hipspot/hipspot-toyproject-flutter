import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_list/components/bottom_navigate_menu.dart';
import 'package:todo_list/components/web_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WebViewController _controller;
  final Completer<WebViewController> returnCompleteController =
      Completer<WebViewController>();

  List<JavascriptChannel> channels = [
    JavascriptChannel(
        name: 'flutterChannel',
        onMessageReceived: (JavascriptMessage message) {
          print(message.message);
        }),
  ];

  void sendToWeb(String message) async {
    print(message);
    await _controller.runJavascriptReturningResult('console.log($message)');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: WebView(
              initialUrl: "http://localhost:3000",
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewcontroller) {
                _controller = webViewcontroller;
                returnCompleteController.complete(webViewcontroller);
              },
              javascriptChannels: Set.from(channels))),
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
              child: BuildBottomNavigationMenu(sendToWeb: sendToWeb),
            ),
          );
        });
  }
}
