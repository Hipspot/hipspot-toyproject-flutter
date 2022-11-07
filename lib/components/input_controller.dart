import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  var _inputController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose(); // 컨트롤러는 종료시 반드시 해제해줘야 함
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _inputController.addListener(() {
      final String text = _inputController.text.toLowerCase();
      _inputController.value = _inputController.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return (TextFormField(
      controller: _inputController,
    ));
  }
}
