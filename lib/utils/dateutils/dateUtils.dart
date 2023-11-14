import 'package:intl/intl.dart';

class MovieDateUtils {
  static String formatReleaseDate(DateTime date) {
    return DateFormat('MMMM d, yyyy').format(date).toString();
  }
}
