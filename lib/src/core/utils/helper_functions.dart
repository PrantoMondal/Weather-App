import 'package:intl/intl.dart';

abstract class HelperFunctions {
  static String formatUnixTimestamp(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);
    final formatter = DateFormat('dd MMM, yyyy');
    return formatter.format(date.toLocal());
  }
}
