import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final real = FirebaseDatabase.instance;
  final fire = FirebaseFirestore.instance;

  rlCreate(String rref, userData) async {
    try {
      CollectionReference usersCollection = fire.collection('Users').doc(rref).collection(rref);
      
      QuerySnapshot querySnapshot = await usersCollection.get();
      int num_s = querySnapshot.size;
      log(num_s.toString());
      
      String docId = "${rref[0]}${(num_s + 1).toString()}";
      await usersCollection.doc(docId).set(userData);
    } catch (e) {
      log(e.toString());
    }
  }
  // rlCreate(String rref, userData) async {
  //   // the rref is student or techer or parent or admin
  //   try {
  //     final allStudents = await real.ref("Users").child(rref).once();
  //     int num_s = allStudents.snapshot.children.length;
  //     log(num_s.toString());
  //     real
  //         .ref("Users")
  //         .child(rref)
  //         .child("${rref[0]}${(num_s + 1).toString()}")
  //         .set(userData);
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

rlRead_ForLogin(String input, String password) async {
  try {
    input = input.replaceAll(' ', '');
    password = password.replaceAll(' ', '');
    log("input $input / $password");

    List<Object>? checkCredentials(
        QuerySnapshot categorySnapshot, String userType) {
      for (var doc in categorySnapshot.docs) {
        String email = (doc['email'] ?? '').toString().replaceAll(' ', '');
        String phone = (doc['phone'] ?? '').toString().replaceAll(' ', '');
        String storedPassword = (doc['password'] ?? '')
            .toString()
            .replaceAll(' ', '');
        log("data $email / $phone / $storedPassword");

        if ((email == input || phone == input) && storedPassword == password) {
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

    QuerySnapshot studentSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Students')
        .collection('Students')
        .get();
    var result = checkCredentials(studentSnapshot, 'Student');
    if (result != null) return result;

    QuerySnapshot parentSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Parent')
        .collection('Parent')
        .get();
    result = checkCredentials(parentSnapshot, 'Parent');
    if (result != null) return result;

    QuerySnapshot teacherSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Teacher')
        .collection('Teacher')
        .get();
    result = checkCredentials(teacherSnapshot, 'Teacher');
    if (result != null) return result;

    QuerySnapshot adminSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc('Admin')
        .collection('Admin')
        .get();
    result = checkCredentials(adminSnapshot, 'Admin');
    if (result != null) return result;

    log('Login failed: Invalid email/phone or password');
    return [false, 'Login failed: Invalid email/phone or password'];
  } catch (e) {
    log(e.toString());
    return [false, e.toString()];
  } 
}
  // rlRead_ForLogin(String input, String password) async {
  //   try {
  //     // Trim the input and password
  //     input = input.replaceAll(' ', ''); //.replaceAll(' ', '')
  //     password = password.replaceAll(' ', '');
  //     log("input $input / $password");

  //     // Fetch data from Firebase Realtime Database
  //     final allData = await real.ref("Users").once();

  //     // Check if the data is not null
  //     if (allData.snapshot.value != null) {
  //       Map<dynamic, dynamic> data =
  //           allData.snapshot.value as Map<dynamic, dynamic>;

  //       // Function to check credentials within a specific category
  //       List<Object>? checkCredentials(
  //           Map<dynamic, dynamic> categoryData, String userType) {
  //         // log(categoryData.toString());
  //         for (var key in categoryData.keys) {
  //           String email = (categoryData[key]['email'] ?? '')
  //               .toString()
  //               .replaceAll(' ', '');
  //           String phone = (categoryData[key]['phone'] ?? '')
  //               .toString()
  //               .replaceAll(' ', '');
  //           String storedPassword = (categoryData[key]['password'] ?? '')
  //               .toString()
  //               .replaceAll(' ', '');
  //           log("data $email / $phone / $storedPassword");

  //           if ((email == input || phone == input) &&
  //               storedPassword == password) {
  //             log('Login successful as $userType: $key');
  //             return [
  //               true,
  //               '$userType-$key',
  //               '${categoryData[key]['state']}',
  //               '${categoryData[key]['name']}-${categoryData[key]['grade']}'
  //             ];
  //           }
  //         }
  //         return null;
  //       }

  //       // Check Students data
  //       if (data['Students'] != null) {
  //         var result = checkCredentials(data['Students'], 'Student');
  //         if (result != null) return result;
  //       }

  //       // Check Parents data
  //       if (data['Parent'] != null) {
  //         var result = checkCredentials(data['Parent'], 'Parent');
  //         if (result != null) return result;
  //       }

  //       // Check Teachers data
  //       if (data['Teacher'] != null) {
  //         var result = checkCredentials(data['Teacher'], 'Teacher');
  //         if (result != null) return result;
  //       }
  //       if (data['Admin'] != null) {
  //         var result = checkCredentials(data['Admin'], 'Admin');
  //         if (result != null) return result;
  //       }

  //       // If no user was found
  //       log('Login failed: Invalid email/phone or password');
  //       return [false, 'Login failed: Invalid email/phone or password'];
  //     } else {
  //       log('Error: Data is null');
  //       return [false, 'Error: Data is null'];
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     return [false, e.toString()];
  //   }
  // }
}