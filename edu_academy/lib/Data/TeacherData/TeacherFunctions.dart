import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:edu_academy/Data/TeacherData/TeacherData.dart';
import 'package:edu_academy/view/StudentPages/PageOne/Contents/MessageBox.dart';
import 'package:edu_academy/view/StudentPages/PageTwo/PageTwo.dart';
import 'package:edu_academy/view/TeacherPages/PageTwo/Contents/Pages/Page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mime/mime.dart';

class TeacherFunctions {
  TeacherFunctions({required this.SetStateCallback});
  Function()? SetStateCallback;
  void update() {
    // Use setStateCallback if it is provided
    if (SetStateCallback != null) {
      SetStateCallback!();
    }
  }

  regetmessages() async {
    //GradeOpenedIndex
    try {
      String grades_ =
          TeacherData.ListOfGrades[GradeOpenedIndex][0].contains('(Lang)')
              ? TeacherData.ListOfGrades[GradeOpenedIndex][0]
                  .replaceAll('(Lang)', '')
                  .trim()
              : TeacherData.ListOfGrades[GradeOpenedIndex][0];
      final real = FirebaseDatabase.instance;
      final allMes = real
          .ref("Messages")
          .child(grades_)
          .child(TeacherData.SubjectThatIsSelected);
      print("grades_ $grades_");
      allMes.onValue.listen(
        (event) {
          try {
            realTimeValues = event.snapshot.value;
            print("realTimeValues $realTimeValues");
            Map map = realTimeValues as Map;
            print("map $map");
            print("map.keys ${map.keys}");
            TeacherData.AllMessages = [];
            for (var i in map.keys) {
              TeacherData.AllMessages.add([map[i][0], map[i][1], map[i][2]]);
              print("map TeacherData.AllMessages $TeacherData.AllMessages");
            }
            if (TeacherData.AllMessages.isEmpty)
              TeacherData.AllMessages = [
                ["Messgae", "Time", "Duration"]
              ];
            TeacherData.AllMessages.sort((a, b) => b[1].compareTo(a[1]));
            TeacherData.AllMessages = TeacherData.AllMessages.reversed.toList();
          } catch (e) {
            TeacherData.AllMessages = [
              ["Messgae", "Time", "Duration"]
            ];
            print("listen map $e");
          }
          update();
        },
      );
    } catch (e) {
      log("e $e");
    }
  }

  Future<List<dynamic>?> webPickFile() async {
    Uint8List? file;
    String? name;
    String? contentType;
    FilePickerResult? result;

    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: false,
    );

    if (result != null) {
      file = result.files.single.bytes;
      name = result.files.single.name;

      contentType = lookupMimeType(name);
      return [
        [file, name, contentType]
      ] as List<dynamic>;
    }

    return null;
  }

  pick_file() async {
    File? file;
    FilePickerResult? result;
    String? name = '';
    result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: false);
    if (result != null) {
      file = File(result.files.single.path!);
      name = result.files.first.name;
      print("#-file $file");
      return [file, name] as List<dynamic>;
    }
  }

  books_load() async {
    BooksAreLoading = true;
    update();
    print("#### ${TeacherData.ListOfGrades[GradeOpenedIndex][0]}");
    print("#### $TeacherData.SubjectThatIsSelected");
    var booksData0 = await dbService.fiRead_Books(
        TeacherData.ListOfGrades[GradeOpenedIndex][0],
        TeacherData.SubjectThatIsSelected);
    print("Books_data $Books_data");
    Books_data = booksData0;
    BooksAreLoading = false;
    update();
  }
}
