import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String _selectedItem = '';
  String getToday() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy년 MM월 dd일');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () => _onButtonPressed(),
                ),
                Text(
                  _selectedItem,
                  style: TextStyle(fontSize: 30),
                )
              ],
            )
        )
    );
  }

  void _onButtonPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child:
                      Icon(Icons.close, color: Color(0xff999999),)
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                color: Color(0xffF2F2F2),
              ),
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 25, 0, 0),
                        child: SizedBox(
                          width: 150,
                          height: 20,
                          child: Text(
                            '해시태그 선택',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Color(0xff666666),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(20, 16, 0, 0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  HashtagButton(text: '#기획'),
                                  SizedBox(width: 12),
                                  HashtagButton(text: '#디자인'),
                                  SizedBox(width: 12),
                                  HashtagButton(text: '#개발'),
                                  SizedBox(width: 12),
                                  HashtagButton(text: '#FE'),
                                ],
                              ),
                              Row(
                                children: [
                                  HashtagButton(text: '#BE'),
                                  SizedBox(width: 12),
                                  HashtagButton(text: '#iOS'),
                                  SizedBox(width: 12),
                                  HashtagButton(text: '#AOS')
                                ]
                              )
                            ],
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
                        child: Text(
                          '할 일 입력',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff666666),
                          ),
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
                        child: SizedBox(
                          width: 350,
                          height: 24,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: '할 일을 입력해 주세요.',
                              labelStyle: TextStyle(
                                color: Color(0xffCCCCCC),
                                fontSize: 16,
                              )
                            ),
                          ),
                        )
                      )
                    ],
                  ),
                ],
              ),
            ],);
        }
    );
  }
}

MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
  getColor(Set<MaterialState> states) {
    if(states.contains(MaterialState.pressed)) {
      return colorPressed;
    } else {
      return color;
    }
  }
  return MaterialStateProperty.resolveWith(getColor);
}


class HashtagButton extends StatelessWidget {
  final String text;
  const HashtagButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
          overlayColor: getColor(Colors.grey, Colors.teal),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
        ),
        onPressed: () {
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xffCCCCCC),
          ),
        )
    );
  }
}
