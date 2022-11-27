import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TodoWebView extends StatelessWidget {
  WebViewController? controller;
  TodoWebView({Key? key, required this.controller}) : super(key: key);
  final Completer<WebViewController> returnCompleteController =
      Completer<WebViewController>();
  var loadingPercentage = 0;
  List<JavascriptChannel> channels = [
    JavascriptChannel(
        name: 'flutterChannel',
        onMessageReceived: (JavascriptMessage message) {
          print(message.message);
        }),
  ];

  @override
  Widget build(BuildContext context) {
    return WebView(
        initialUrl: "http://localhost:3000",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewcontroller) {
          controller = webViewcontroller;
          returnCompleteController.complete(webViewcontroller);
        },
        javascriptChannels: Set.from(channels));
  }
}
