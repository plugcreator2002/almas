import 'package:almas/utils/date_related/models/past_time.dart';
import 'package:almas/utils/date_related/time_related.dart';
import 'package:psr_base/utils/operations_related/handle_nullable.dart';

class DateHandle {
  static DateTime? timeStampToDate(num? timeStamp) {
    if (timeStamp.isNull) return null;
    final result = DateTime.fromMillisecondsSinceEpoch(
      (timeStamp ?? 0).toInt() * 1000,
    );
    return result;
  }

  static DateTime? stringToDate(String timeStamp) {
    final result = DateTime.tryParse(timeStamp);
    return result;
  }

  static String isOneLength(num? number) {
    if (number == null) return "";
    if (number.toString().length == 1) {
      return "0$number";
    }
    return number.toString();
  }

  static PastTime agoTimeStamp(String? formattedString) {
    if (formattedString != null && formattedString.isNotEmpty) {
      final date = DateTime.tryParse(formattedString);

      return date.toString().agoTime;
    }
    return PastTime.non();
  }
}
