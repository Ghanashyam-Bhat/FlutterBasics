import 'package:age/age.dart';

//https://dart.dev/null-safety/unsound-null-safety

//Disable sound null safety using the --no-sound-null-safety flag to the dart or flutter command: $ dart --no-sound-null-safety run $ flutter run --no-sound-null-safety.
// Alternatively, set the language version in the entrypoint—the file that contains main() function—to 2.9.

class AgeCalculation{
  //TO calculate age of a person
  AgeDuration CalculateAge(DateTime today,DateTime birthday){
    AgeDuration age = Age.dateDifference(fromDate: birthday, toDate: today,includeToDate: false);
    return age;
  }

  //To check next birthday
  nextBirthday(DateTime today, DateTime birthday){
    DateTime temp = DateTime(today.year,birthday.month,birthday.day);

    DateTime nextBirthdayDate = temp.isBefore(today)
          ?Age.add(date: temp, duration: AgeDuration(years: 1))
          :temp;
    
    AgeDuration nextBirthdayDuration = Age.dateDifference(fromDate: today, toDate: nextBirthdayDate);
    return nextBirthdayDuration;
  }

  List<String> WeekDay = [
    "WeekDays",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  //Calculate week day
  String nextWeekDay(DateTime today, DateTime birthday){
    DateTime temp = DateTime(today.year,birthday.month,birthday.day);

    DateTime nextBirthdayDate = temp.isBefore(today)
        ?Age.add(date: temp, duration: AgeDuration(years: 1))
        :temp;

    return WeekDay[nextBirthdayDate.weekday];
  }
}

