import 'package:edu_academy/MyTools/MyFunctionTools.dart';
import 'package:edu_academy/MyTools/MyTools.dart';
import 'package:edu_academy/view/StudentPages/SignUp/StudentMobileSignUpPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';
class BirthDateWidget extends StatefulWidget {
  const BirthDateWidget({super.key});

  @override
  State<BirthDateWidget> createState() => _BirthDateWidgetState();
}

class _BirthDateWidgetState extends State<BirthDateWidget> {
  @override
  Widget build(BuildContext context) {
    return (kIsWeb)
        ? MyButton(
            padding: const EdgeInsets.all(10),
            buttonColor: const Color.fromARGB(255, 74, 193, 241),
            text: StudentDateOfBirth,
            onTap: () async {
              var TimeSelected = await showOmniDateTimePicker(
                context: context,
                initialDate: DateTime.now(),
                type: OmniDateTimePickerType.date,
                is24HourMode: false,
                isShowSeconds: false,
                minutesInterval: 1,
                secondsInterval: 1,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                constraints: const BoxConstraints(
                  maxWidth: 350,
                  maxHeight: 650,
                ),
                transitionBuilder: (context, anim1, anim2, child) {
                  return FadeTransition(
                    opacity: anim1.drive(
                      Tween(
                        begin: 0,
                        end: 1,
                      ),
                    ),
                    child: child,
                  );
                },
                selectableDayPredicate: (p0) {
                  if (p0 == DateTime.now()) {
                    return false;
                  } else {
                    return true;
                  }
                },
                transitionDuration: const Duration(milliseconds: 200),
                barrierDismissible: true,
              );
              StudentDayOfBirth = TimeSelected!.day.toString();
              StudentMonthOfBirth = TimeSelected.month.toString();
              StudentYearOfBirth = TimeSelected.year.toString();
              StudentDateOfBirth = "$StudentDayOfBirth / $StudentMonthOfBirth / $StudentYearOfBirth";
              setState(() {});
            })
        : TimePickerSpinnerPopUp(
            textStyle: const TextStyle(fontSize: 25),
            iconSize: 40,
            minTime: DateTime.now().subtract(const Duration(days: 36525)),
            maxTime: DateTime.now().subtract(const Duration(days: 1824)),
            mode: CupertinoDatePickerMode.date,
            initTime: forDateInput,
            onChange: (dateTime) {
              setState(() {
                forDateInput = dateTime;
                StudentDayOfBirth = dateTime.day.toString();
                StudentMonthOfBirth = dateTime.month.toString();
                StudentYearOfBirth = dateTime.year.toString();
                StudentDateOfBirth = "$StudentDayOfBirth/$StudentMonthOfBirth/$StudentYearOfBirth";
                print(StudentDateOfBirth);
              });
            },
          );
  }
}