library dartkit.time;

import "package:intl/intl.dart";

class RelativeDateFormat {
  static String from(DateTime time) {
    DateTime now = DateTime.now();
    // make sure we're always in the positive
    Duration diff = time.compareTo(now) > 0 ? time.difference(now) : now.difference(time);

    DateFormat format = DateFormat();

    if (diff.inHours <= 24) {
      return format.add_jm().format(time);
    }

    if (diff.inDays <= 7) {
      return format.add_EEEE().format(time);
    }

    return format.add_yMd().format(time);
  }
}