import 'package:age_calculator/age_calculator.dart';

import 'ageShow.dart';
import 'durationnext.dart';
// ignore: import_of_legacy_library_into_null_safe, unused_import
import 'package:age/age.dart';

class age_calculator {
  ageShow calculate_age(DateTime datebirthday, DateTime dateToday) {
    AgeDuration age;
    age = Age.dateDifference(
        fromDate: datebirthday, toDate: dateToday, includeToDate: false);
    ageShow userage = ageShow();
    userage.years = age.years;
    userage.months = age.months;
    userage.days = age.days;
    return userage;
  }

  NextDuration nextBirthdayCalculate(
      DateTime datebirthday, DateTime dateToday) {
    DateTime nextBirthdayDate;
    DateTime tempDate =
        DateTime(dateToday.year, datebirthday.month, datebirthday.day);
    if (tempDate.isBefore(dateToday)) {
      nextBirthdayDate =
          Age.add(date: tempDate, duration: AgeDuration(years: 1));
    } else {
      nextBirthdayDate = tempDate;
    }
    AgeDuration nextBirthdayDuration =
        Age.dateDifference(fromDate: dateToday, toDate: nextBirthdayDate);

    NextDuration nextbirthday = NextDuration();
    nextbirthday.year = nextBirthdayDuration.years;
    nextbirthday.month = nextBirthdayDuration.months;
    nextbirthday.day = nextBirthdayDuration.days;
    return nextbirthday;
  }
}
