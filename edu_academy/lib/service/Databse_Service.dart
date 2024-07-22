import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final real = FirebaseDatabase.instance;
  final fire = FirebaseFirestore.instance;

  fiCreate(String rref, userData) async {
    try {
      CollectionReference usersCollection =
          fire.collection('Users').doc(rref).collection(rref);

      QuerySnapshot querySnapshot = await usersCollection.get();
      int num_s = querySnapshot.size;
      log(num_s.toString());

      String docId = "${rref[0]}${(num_s + 1).toString()}";
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

      List<Object>? checkCredentials(
          QuerySnapshot categorySnapshot, String userType) {
        for (var doc in categorySnapshot.docs) {
          String email = (doc['email'] ?? '').toString().replaceAll(' ', '');
          String phone = (doc['phone'] ?? '').toString().replaceAll(' ', '');
          String storedPassword =
              (doc['password'] ?? '').toString().replaceAll(' ', '');
          log("data $email / $phone / $storedPassword");

          if ((email == input || phone == input) &&
              storedPassword == password) {
            log('Login successful as $userType: ${doc.id}');
            return [
              true,
              '$userType', //${doc.id}
              '${doc['state']}',
              '${doc['name']}-${doc['grade']}'
            ];
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

    List<List<dynamic>> ret_list = [];

    ///Records/Zoom/Grades/Grade 1/G1Arabic/REC1

    QuerySnapshot studentSnapshot = await fire
        .collection('Records')
        .doc("Zoom")
        .collection("Grades")
        .doc(grade)
        .collection(subject)
        .get();

    for (var i in studentSnapshot.docs) {
      ret_list.add(["${i['link']}", "${i['date']}"]);
    }
    log(ret_list.toString());
    return  ret_list as List<List<dynamic>>;
  }
}
