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
  String getToday() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy년 MM월 dd일');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        isScrollControlled: true,   // Set the BottomSheet to be expanded more
        builder: (context) {
          return Container(
            color: Color(0xff737373),
            height: MediaQuery.of(context).size.height*0.9,   // Height of the phone * 0.9
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,   // The default color of MaterialType.canvas material
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)
                  )
                ),
              child: _buildBottomNavigationMenu(),
            ),
          );
        }
    );
  }

  Column _buildBottomNavigationMenu() {
    return Column(

      children: [
        Column(
          children: [
            Row(    // The first two lines with X icon
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(     // The first two lines
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
                Padding(    // X icon which works to close the bottom sheet
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child:
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                      color: Color(0xff999999),
                    )
                ),
              ],
            ),
            Divider(    // The line
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
                  ],
                ),
              ],
            ),
          ],
        ),
        Test(),
      ],
    );
  }
}


// Setting spreading color when tapping on the button
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


// Hashtag Button
class HashtagButton extends StatefulWidget {
  final String text;
  const HashtagButton({Key? key, required this.text}) : super(key: key);

  @override
  State<HashtagButton> createState() => _HashtagButtonState();
}

class _HashtagButtonState extends State<HashtagButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
          overlayColor: getColor(Colors.grey, Colors.pink),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
          side: MaterialStateProperty.all(BorderSide(color: _isPressed ? Color(0xffE44269) : Color(0xffCCCCCC)))
        ),
        onPressed: () {
          setState(() {
            _isPressed = !_isPressed;
          });
        },
        child: Text(
          widget.text,              // Getting parameters from HashtagState class
          style: TextStyle(
            fontSize: 16,
            color: _isPressed ? Color(0xffE44269) : Color(0xffCCCCCC),
          ),
        )
    );
  }
}




// '할 일 입력', TextField, Button all included (colors changing in real time)
class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool _isFilled = false;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
                  child: Text(
                    '할 일 입력',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff666666),
                    ),
                    textAlign: TextAlign.start,
                  )
              ),

            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
                    child: SizedBox(
                      width: 350,
                      height: 24,
                      child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.pink)
                            ),
                            hintText: '할 일을 입력해 주세요.',
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 4),
                            hintStyle: TextStyle(
                                color: Color(0xffCCCCCC),
                                fontSize: 16,
                            )
                        ),
                        onChanged: (value) {
                          setState(() {
                            if(value.isEmpty) {
                              _isFilled = false;
                            } else {
                              _isFilled = true;
                            }
                          });
                        },
                      ),
                    )
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, MediaQuery.of(context).viewInsets.bottom + 12),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isFilled ? Colors.pink : Colors.grey,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                        ),
                        onPressed: () {

                        },
                        child: Text('추가하기')
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),

    )
    ;
  }
}
