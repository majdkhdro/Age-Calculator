// ignore: avoid_web_libraries_in_flutter, unused_import
// ignore_for_file: deprecated_member_use

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ageShow.dart';
import 'package:flutter_application_1/age_calculator.dart';
import 'package:flutter_application_1/durationnext.dart';

// ignore: camel_case_types, must_be_immutable
class myscreen extends StatefulWidget {
  myscreen({Key? key}) : super(key: key);

  @override
  State<myscreen> createState() => _myscreenState();
}

class _myscreenState extends State<myscreen> {
  late BuildContext context;

  DateTime? birthday;
  DateTime? todaydate;

  TextEditingController dateofBirthController =
      TextEditingController(text: '01-01-2000');

  TextEditingController todaydateController =
      TextEditingController(text: '01-01-2020');

  ageShow userage = ageShow();

  NextDuration nextBirthday = NextDuration();

  @override
  Widget build(BuildContext context) {
    this.context = context;

    Widget text1 = _bulidText('Data Of Berth');
    Widget filedDateBirth = _buildFiledDateBirth();
    Widget text2 = _bulidText('Today Date');
    Widget filedTodaydate = _buildFiledTodaydate();
    Widget button = _buildButton();
    Widget text3 = _bulidText('Age is');
    Widget filedYears = _buildOutput('Year', userage.years.toString());
    Widget filedMonth = _buildOutput('Month', userage.months.toString());
    Widget filedDay = _buildOutput('Day', userage.days.toString());
    Widget text4 = _bulidText('Next Birth Day is');
    Widget filedYearsNext = _buildOutput('Year', nextBirthday.year.toString());
    Widget filedMonthNext =
        _buildOutput('Month', nextBirthday.month.toString());
    Widget filedDayNext = _buildOutput('Day', nextBirthday.day.toString());
    Widget emptyBox = const SizedBox(
      height: 25,
    );

    return Column(
      children: <Widget>[
        emptyBox,
        text1,
        filedDateBirth,
        emptyBox,
        text2,
        filedTodaydate,
        emptyBox,
        button,
        emptyBox,
        text3,
        emptyBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [filedYears, filedMonth, filedDay],
        ),
        emptyBox,
        text4,
        emptyBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [filedYearsNext, filedMonthNext, filedDayNext],
        )
      ],
    );
  }

  _bulidText(String t) {
    return Text(t);
  }

  _buildFiledDateBirth() {
    return TextField(
      //controller: dateinput, //editing controller of this TextField
      decoration: _filedDecor(),
      showCursor: true,
      readOnly: true,
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(
                    1960), //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2101))
            .then((date) {
          if (date == null) {
            setState(() {
              dateofBirthController.text = '';
            });
          } else {
            setState(() {
              dateofBirthController.text = _formatDate(date!);
            });
          }

          birthday = date;
        });
      },
      controller: dateofBirthController,
    );
  }

  _filedDecor() {
    return InputDecoration(
        suffixIcon: Icon(
          Icons.calendar_today,
          color: Theme.of(context).primaryColor,
        ), //icon of text field
        labelText: "Enter Date", //label text of field
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
        )),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor)));
  }

  _buildFiledTodaydate() {
    return TextField(
      //controller: dateinput, //editing controller of this TextField
      decoration: _filedDecor(),
      readOnly: true,
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(
                    2000), //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2101))
            .then((date) {
          if (date == null) {
            setState(() {
              todaydateController.text = '';
            });
          } else {
            setState(() {
              todaydateController.text = _formatDate(date!);
            });
          }

          todaydate = date;
        });
      },
      controller: todaydateController,
    );
  }

  _buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // ignore: avoid_unnecessary_containers
        ButtonTheme(
          minWidth: 160,
          height: 60,
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              // ignore: avoid_print
              dateofBirthController.clear();
              todaydateController.clear();
              userage.clearAge();
              nextBirthday.clearNextDuration();

              setState(() {});
            },
            child: const Text(
              'CLEAR',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        ButtonTheme(
          minWidth: 160,
          height: 60,
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              userage = age_calculator().calculate_age(birthday!, todaydate!);
              nextBirthday =
                  age_calculator().nextBirthdayCalculate(birthday!, todaydate!);
              setState(() {});
            },
            child: const Text(
              'CALCULATE',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildOutput(String title, String data) {
    return Column(children: [
      Container(
        // ignore: sort_child_properties_last
        child: Center(
          child: Text(title, style: const TextStyle(color: Colors.white)),
        ),
        width: 115,
        height: 30,
        color: Theme.of(context).primaryColor,
      ),
      Container(
        // ignore: sort_child_properties_last
        child: Center(child: Text(data)),
        width: 115,
        height: 30,
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor)),
      )
    ]);
  }

  _formatDate(DateTime dt) {
    var formate2 = "${dt.day}-${dt.month}-${dt.year}";
    return formate2.toString();
  }
}
