import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Post> fetchPost() async {
  final response =
  await http.get(Uri.parse('https://hipspot-todo.endless-creation.com/todo/2'));

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
    return Post.fromJson(json.decode(response.body));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}

class Post {
  final String title;
  final String content;
  final bool isComplete;
  final String tag;
  final String modifiedDate;

  Post({
    required this.title,
    required this.content,
    required this.isComplete,
    required this.tag,
    required this.modifiedDate,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      content: json['content'],
      isComplete: json['isComplete'],
      tag: json['tag'],
      modifiedDate: json['modifiedDate'],
    );
  }
}