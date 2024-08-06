import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

Map<String, List<List<String>>> Students_in_grades = {};

class DatabaseService {
  final real = FirebaseDatabase.instance;
  final fire = FirebaseFirestore.instance;

  // rePublicMessages_read(){

  // }
  rePublicMessages_Send(String sub , String Grade){
    

  }

  fiCreate(String rref, userData) async {
    try {
      CollectionReference usersCollection =
          fire.collection('Users').doc(rref).collection(rref);

      QuerySnapshot querySnapshot = await usersCollection.get();
      int numS = querySnapshot.size;
      log(numS.toString());

      String docId = "${rref[0]}${(numS + 1).toString()}";
      await usersCollection.doc(docId).set(userData);
    } catch (e) {
      log(e.toString());
    }
  }

  fiRead_ForLogin(String input, String password) async {
    try {
      input = input.replaceAll(' ', '');
      password = password.replaceAll(' ', '');
      log("input $input / $password");

      List? checkCredentials(QuerySnapshot categorySnapshot, String userType) {
        for (var doc in categorySnapshot.docs) {
          String email = (doc['email'] ?? '').toString().replaceAll(' ', '');
          String phone = (doc['phone'] ?? '').toString().replaceAll(' ', '');
          String storedPassword =
              (doc['password'] ?? '').toString().replaceAll(' ', '');
          log("$userType: ${doc.id} $email / $phone / $storedPassword");

          if ((email == input || phone == input) &&
              storedPassword == password) {
            log('Login successful as $userType: ${doc.id}');

            if (userType == "Student") {
              return [
                true,
                '$userType#${doc.id}',
                '${doc['state']}',
                "${doc['name']}-${doc['grade']}"
              ];
            } else if (userType == "Teacher") {
              return [
                true,
                '$userType#${doc.id}',
                '${doc['state']}',
                "${doc['name']}-${doc['Subject1']}-${doc['Subject2']}-${doc['Subject3']}"
              ];
            } else {
              return [
                true,
                '$userType#${doc.id}',
                '${doc['state']}',
                "${doc['name']}"
              ];
            }
          }
        }
        return null;
      }

      QuerySnapshot studentSnapshot = await fire
          .collection('Users')
          .doc('Students')
          .collection('Students')
          .get();
      var result = checkCredentials(studentSnapshot, 'Student');
      if (result != null) return result;

      QuerySnapshot parentSnapshot = await fire
          .collection('Users')
          .doc('Parent')
          .collection('Parent')
          .get();
      result = checkCredentials(parentSnapshot, 'Parent');
      if (result != null) return result;

      QuerySnapshot teacherSnapshot = await fire
          .collection('Users')
          .doc('Teacher')
          .collection('Teacher')
          .get();
      result = checkCredentials(teacherSnapshot, 'Teacher');
      if (result != null) return result;

      QuerySnapshot adminSnapshot =
          await fire.collection('Users').doc('Admin').collection('Admin').get();
      result = checkCredentials(adminSnapshot, 'Admin');
      if (result != null) return result;

      log('Login failed: Invalid email/phone or password');
      return [false, 'Login failed: Invalid email/phone or password'];
    } catch (e) {
      log(e.toString());
      return [false, e.toString()];
    }
  }

  fiRead_Records(String grade, String subject) async {
    log("fiRead_Records");
    List<List<dynamic>> retList = [];

    ///Records/Zoom/Grades/Grade 1/G1Arabic/REC1
    QuerySnapshot studentSnapshot = await fire
        .collection('Records')
        .doc("Zoom")
        .collection("Grades")
        .doc(grade)
        .collection(subject)
        .get();

    for (var i in studentSnapshot.docs) {
      retList.add(["${i['link']}", "${i['date']}"]);
    }
    log(retList.toString());
    return retList;
  }

  fiRead_Books(String grade, String subject) async {
    log("fiRead_Books");
    log(grade);
    log(subject);
    List<List<dynamic>> retList = [];
    //Book/SubjectsBooks/Grades/Grade 1/عربي/Book1
    QuerySnapshot studentSnapshot = await fire
        .collection('Book')
        .doc("SubjectsBooks")
        .collection("Grades")
        .doc(grade)
        .collection(subject)
        .get();

    for (var i in studentSnapshot.docs) {
      retList.add(["${i['link']}", "${i['date']}", "${i['title']}"]);
    }
    log(retList.toString());
    return retList;
  }

  get_all_students_with_grade() async {
    Students_in_grades = {};
    ///Users/Students/Students/S1
    QuerySnapshot StudentsSnapshot = await fire
        .collection('Users')
        .doc('Students')
        .collection('Students')
        .get();
    for (var doc in StudentsSnapshot.docs) {
      if (!Students_in_grades.containsKey(doc["grade"])) {
        Students_in_grades[doc["grade"].toString()] = [];
      }
      Students_in_grades[doc["grade"].toString()]?.add([doc['name'],doc.id,"image"]);
    }
    print(Students_in_grades);
  }

  fiGrades_and_Students(String teacherId, List<dynamic> Subjects) async {
    print("im running.......");
    await get_all_students_with_grade();
    //  sub           garde   [gardes]
    Map<String, Map<String, List<dynamic>>> lastRe = {};
    for (String i in Subjects) {
      List ll = i.replaceAll(RegExp(r"[\[\]']"), '').split(", ");
      print(ll[0]);
      print(ll.sublist(1));
      for (var j in ll.sublist(1)) {
        print(j);
        print(Students_in_grades[j.toString()]);
        if (!lastRe.containsKey(ll[0])) lastRe[ll[0]] = {};

        if (!lastRe[ll[0]]!.containsKey(j)) lastRe[ll[0]]![j] = [];

        lastRe[ll[0]]![j] = Students_in_grades[j.toString()] ?? [];
      }
    }
    print(lastRe);
    return lastRe;
  }
}


  // fiGrades_and_Students(String teacherId) async {
  //   QuerySnapshot teacherSnapshot = await fire
  //       .collection('Users')
  //       .doc('Teacher')
  //       .collection('Teacher')
  //       .get();
  //   List grades = [];
  //   for (var doc in teacherSnapshot.docs) {
  //     if (doc.id == teacherId) {
  //       grades = doc['grades'];
  //       break;
  //     }
  //   }
  //   if (grades.isEmpty) return null;
  //   QuerySnapshot StudentsSnapshot = await fire
  //       .collection('Users')
  //       .doc('Student')
  //       .collection('Student')
  //       .get();
  //   Map<String, List<String>> gradesStudents = {};
  //   for (var doc in StudentsSnapshot.docs) {
  //     for (var grade in grades) {
  //       if (grade == doc['grades']) {
  //         gradesStudents[grade]?.add(doc.id);
  //       }
  //     }
  //   }
  //   print(gradesStudents);
  //   return gradesStudents;
  // }



    // Map<String, List<String>> GradesSubjects_names = {};
    // for (String gg in GradesSubjects.keys) {
    //   for (int nu in GradesSubjects[gg]) {
    //     if (!GradesSubjects_names.containsKey(gg)) GradesSubjects_names[gg] = [];
    //     GradesSubjects_names[gg]?.add(Subjects[nu][1]);
    //   }
    // }
    // print("GradesSubjects_names $GradesSubjects_names");

    // print(GradesSubjects_names);
    // DocumentSnapshot<Map<String, dynamic>> teacherSnapshot = await fire
    //     .collection('Users')
    //     .doc('Teacher')
    //     .collection('Teacher')
    //     .doc(teacherId)
    //     .get();
    // List grades = [];
    // for (var doc in teacherSnapshot["grades"]) {
    //   if (doc.id == teacherId) {
    //     grades = doc['grades'];
    //     break;
    //   }
    // }

    // if (grades.isEmpty) return null;

    // QuerySnapshot StudentsSnapshot = await fire
    //     .collection('Users')
    //     .doc('Student')
    //     .collection('Student')
    //     .get();
    // Map<String, List<String>> gradesStudents = {};
    // for (var doc in StudentsSnapshot.docs) {
    //   for (var grade in grades) {
    //     if (grade == doc['grades']) {
    //       gradesStudents[grade]?.add(doc.id);
    //     }
    //   }
    // }
    // print(gradesStudents);
    // return gradesStudents;







