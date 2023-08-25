import 'package:intl/intl.dart';

String formatTime(DateTime value) {
  final date = DateFormat('MMMMEEEEd').format(value);
  final time = DateFormat('Hm').format(value);

  return "$date - $time";
}
