import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/utils/date_related/models/past_time.dart';
import 'package:psr_base/packages.dart';

extension TimeRelated on String {
  PastTime get agoTime {
    final date = DateTime.parse(this);
    final difference = DateTime.now().difference(date);
    PastTime pastTime = PastTime(0, "just-now".tr);

    if (difference.inDays > 365) {
      return PastTime((difference.inDays / 365).floor(), "year".tr);
    }
    if (difference.inDays > 30) {
      return PastTime((difference.inDays / 30).floor(), "month".tr);
    }
    if (difference.inDays > 7) {
      return PastTime((difference.inDays / 7).floor(), "week".tr);
    }
    if (difference.inDays > 0) {
      return PastTime(difference.inDays, "day".tr);
    }
    if (difference.inHours > 0) {
      return PastTime(difference.inHours, "hour".tr);
    }
    if (difference.inMinutes > 0) {
      return PastTime(difference.inMinutes, "minute".tr);
    }

    return pastTime;
  }

  String convertToTime({String pattern = "hh:mm", String format = "pm"}) {
    final time = DateFormat(pattern).format(
      DateTime.parse(this),
    );
    return "$time$format";
  }
}
