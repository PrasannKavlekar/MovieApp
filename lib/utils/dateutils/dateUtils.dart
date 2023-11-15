import 'package:intl/intl.dart';

class MovieDateUtils {
  static String formatReleaseDate(DateTime date) {
    return DateFormat('MMMM d, yyyy').format(date).toString();
  }

  static String formatBasicDate(DateTime date) {
    return DateFormat('dd MMM').format(date).toString();
  }

  static String formatBasicTime(DateTime date) {
    return DateFormat('hh:mm').format(date).toString();
  }
}
