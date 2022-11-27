import 'dart:ffi';

class CreateTodoData {
  final String title;
  final String tag;
  final String content;
  CreateTodoData(
      {required this.title, required this.tag, required this.content});
}

class EditTodoData {
  final int id;
  final String title;
  final String tag;
  final String content;
  EditTodoData(
      {required this.id,
      required this.title,
      required this.tag,
      required this.content});
}
