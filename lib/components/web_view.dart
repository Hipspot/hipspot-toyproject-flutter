import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TodoWebView extends StatelessWidget {
  const TodoWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WebView(
      initialUrl: 'https://hipspottodo.netlify.app/',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
