import 'package:intl/intl.dart';

const SERVER_DATE_PATTERN = "yyyy-MM-dd";

const PRESENT_DATE_PATTERN = "dd/MM/yyyy";

String formatDate(String? date, {String src = SERVER_DATE_PATTERN, String dest = PRESENT_DATE_PATTERN}) {
  if (date == null || date.isEmpty) {
    return '';
  } else {
    var inputDate = DateFormat(src).parse(date);
    var outputFormat = DateFormat(dest);
    return outputFormat.format(inputDate);
  }
}
