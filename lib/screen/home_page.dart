import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_list/components/bottom_navigate_menu.dart';
import 'package:todo_list/model/transfer_message_model.dart';
import 'package:todo_list/type/open_mode_type.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final GlobalKey<NavigatorState> naviagatorState =
      GlobalKey<NavigatorState>();

  @override
  State<HomePage> createState() => _HomePageState();
}

late WebViewController _controller;

Future<void> sendToWeb(TransferMessageModel message) async {
  print(message.toMap().toString().trim());

  await _controller.runJavascript(
      'window.fromFlutter(${message.toMap().toString().trim()})');
}

class _HomePageState extends State<HomePage> {
  final Completer<WebViewController> controller =
      Completer<WebViewController>();

  static void onFloatButtonPressed(context) {
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
              child: BuildBottomNavigationMenu(
                sendToWeb: sendToWeb,
              ),
            ),
          );
        });
  }

  //웹에서 보내줄 때
  List<JavascriptChannel> channels(context) {
    return [
      JavascriptChannel(
          name: 'flutterChannel',
          onMessageReceived: (JavascriptMessage fromWebViewMessage) {
            print('messageFromWebvie : ${fromWebViewMessage}');

            Map<String, dynamic> message =
                jsonDecode(fromWebViewMessage.message);
            if (message["type"] == "openEditModal") {
              onFloatButtonPressed(context);
            }
          }),
    ];
  }

  //웹으로 보내줄 때

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: WebView(
              initialUrl: "http://localhost:3000",
              debuggingEnabled: true,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewcontroller) {
                controller.complete(webViewcontroller);
                _controller = webViewcontroller;
              },
              javascriptChannels: Set.from(channels(context)))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          onFloatButtonPressed(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
