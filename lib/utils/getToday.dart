import 'package:intl/intl.dart';

String getToday() {
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('yyyy년 MM월 dd일');
  return formatter.format(now);
}
