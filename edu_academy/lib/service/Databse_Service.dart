import 'dart:developer';
// import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_academy/ParentPages/ParentMainPage.dart';
import 'package:edu_academy/StudentPages/SecondPageContents.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

Map<String, List<List<String>>> Students_in_grades = {};

class DatabaseService {
  final real = FirebaseDatabase.instance;
  final fire = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  // RealTime
  rePublicMessages_Send(String sub, String Grade, String messgae, String date,
      String duration, String name) async {
    try {
      final allStudents = real.ref("Messages").child(Grade).child(sub);
      final oness = await allStudents.once();
      print(oness.snapshot.value);
      int numS = oness.snapshot.children.length;
      log(numS.toString());
      await allStudents
          .child("messgae${numS + 1}")
          .set([messgae, date, duration, name]);
    } catch (e) {
      log(e.toString());
    }
  }

  // FireStore
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
      Students_in_grades[doc["grade"].toString()]
          ?.add([doc['name'], doc.id, doc['photo']]);
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

  fiAdd_Hw(
      String Grade,
      String Subject,
      String teacherId,
      List<dynamic> filesList,
      String HomeworkTitle,
      String HomeworkBody,
      String score) async {
    ///Homework/Grade 1/عربي
    CollectionReference Homework =
        fire.collection('Homework').doc(Grade).collection(Subject);

    QuerySnapshot querySnapshot = await Homework.get();
    int numHw = (querySnapshot.size) + 1;
    log(numHw.toString());
    var doc_id = Homework.doc();
    doc_id.set({
      "title": HomeworkTitle,
      "body": HomeworkBody,
      "files": filesList,
      "score": score,
      "date": "current_date",
      'id': doc_id.id
    });

    return true;
  }

  fiGet_Hw(String Grade, String student_id) async {
    print("fiGet_Hw student_id ${student_id}");
// Reference to the specific document within the 'Homework' collection
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('Homework').doc(Grade);

    // List of known sub-collection names
    List<String> knownCollections = [];
    for (var i in GradesSubjects[Grade]!) {
      knownCollections.add(Subjects[i][1]);
    }
    print("knownCollections $knownCollections");

    Map<String, List<dynamic>> out = {};
    List<dynamic> outFinal = [];

    for (String collectionName in knownCollections) {
      CollectionReference collection =
          documentReference.collection(collectionName);

      out[collectionName] = [collectionName];

      QuerySnapshot querySnapshot = await collection.get();
      print(
          'Collection: $collectionName, Document count: ${querySnapshot.size}');

      for (var doc in querySnapshot.docs) {
        print('Document ID: ${doc.id}, Data: ${doc.data()}');
        out[collectionName]?.add(doc.data());
      }
    }
    for (String sub_name in knownCollections) {
      //Homework/Grade 1/عربي/NY63UvWuWPWfjzutq745/Solve/S1
      print("sub_name ${sub_name}");
      print("out ${out[sub_name]}");
      List hhww = [sub_name];
      for (var j in out[sub_name]!.sublist(1)) {
        print("j.keys ${j.keys}");
        try {
          var collection0 = documentReference
              .collection(sub_name)
              .doc("${j["id"]}")
              .collection('Solve');
          var querySnapshot = await collection0.get();
          // print({querySnapshot});
          print("## querySnapshot.docs.length ${querySnapshot.docs.length}");
          if (querySnapshot.docs.length == 0) {
            hhww.add([
              'mohmm',
              j["body"],
              j["title"],
              j["files"],
              [],
              j["date"],
              j["score"],
              [false],
              j["id"],
            ]);
          } else {
            bool ioSolve = false;
            for (var doc0 in querySnapshot.docs) {
              print("## doc0 ${doc0.id}");
              if (doc0.id == student_id) ioSolve = true;
            }
            if (ioSolve) {
              ioSolve = false;
              var collection01 = await documentReference
                  .collection(sub_name)
                  .doc("${j["id"]}")
                  .collection('Solve')
                  .doc(student_id)
                  .get();
              Map<String, dynamic>? data =
                  collection01.data() as Map<String, dynamic>?;
              if (data?["score"] == '0') {
                hhww.add([
                  'mohmm',
                  j["body"],
                  j["title"],
                  j["files"],
                  [],
                  j["date"],
                  j["score"],
                  [
                    true,
                    [data?["body"], data?["files"]]
                  ],
                  j["id"],
                ]);
              } else {
                hhww.add([
                  'mohmm',
                  j["body"],
                  j["title"],
                  j["files"],
                  [],
                  j["date"],
                  j["score"],
                  [
                    true,
                    [data?["body"], data?["files"]],
                    [data?["score"], data?["comment"]]
                  ],
                  j["id"],
                ]);
              }
              // out_list.add([
              //   doc.id,
              //   doc["title"],
              //   doc['body'],
              //   doc['files'],
              //   doc['score'],
              //   data?["body"],
              //   data?["files"],
              //   data?["score"]
              //   // doc.id
              // ]);
            } else {
              hhww.add([
                'mohmm',
                j["body"],
                j["title"],
                j["files"],
                [],
                j["date"],
                j["score"],
                [false],
                j["id"],
              ]);
            }
          }
        } catch (e) {
          print("##not-solve");
        }
      }
      outFinal.add(hhww);
      print("out_final $outFinal");
    }
    return outFinal;
  }

  FiAdd_Solve(List<dynamic> hw_id, String student_id, String hw_solve_body,
      List<dynamic> hw_solve_files) async {
    // hw id,student_id,hw solve body,hw files

    ///Homework/Grade 1/عربي/NY63UvWuWPWfjzutq745/solve /id
    print("FiAdd_Solve hw_id ${hw_id}");
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Homework')
        .doc(hw_id[0])
        .collection(hw_id[3])
        .doc(hw_id[2])
        .collection("Solve")
        .doc(student_id);

    documentReference.set({
      "body": hw_solve_body,
      "files": "hw_solve_files",
      'date': "current_date",
      'score': '0'
    });

    return true;

    // DocumentSnapshot documentSnapshot = await documentReference.get();

    // Map<String, dynamic>? data =
    //     documentSnapshot.data() as Map<String, dynamic>?;
    // // Now you can access your data using the `data` variable.
    // print(data);
  }

  Fi_getAll_HW(String grade, String subject) async {
    CollectionReference collection = FirebaseFirestore.instance
        .collection('Homework')
        .doc(grade)
        .collection(subject);

    QuerySnapshot querySnapshot = await collection.get();
    List<dynamic> out_hw = [];
    for (var doc in querySnapshot.docs) {
      print('Data: ${doc.data()}\n');
      out_hw.add(
          [doc['title'], doc['body'], doc['date'], doc['score'], doc['files']]);
    }
    return out_hw;
  }

  FiGet_profile_data(String id, String role) async {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(role + "s")
        .collection(role + "s")
        .doc(id);

    ///Users/Students/Students/S5  Student
    DocumentSnapshot documentSnapshot = await documentReference.get();
    print(documentSnapshot);
    Map<String, dynamic>? data =
        documentSnapshot.data() as Map<String, dynamic>?;
    print(data);
    return data as Map<String, dynamic>;
  }

  FiAdd_photo(String id, String role, var photo) async {
    // print(file[0]);
    // List<String> name = photo.toString().split("/");
    // String fileName = name[name.length - 1].replaceAll("'", "");
    var snapshot = await storage
        .ref()
        .child('Profiles/${role}/${id}/${id}profile_image')
        .putFile(photo);
    var downloadUrl = await snapshot.ref.getDownloadURL();
    print(downloadUrl);
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(role + "s")
        .collection(role + "s")
        .doc(id);
    documentReference.update({'photo': "$downloadUrl"});

    // ///Users/Students/Students/S5  Student
    // DocumentSnapshot documentSnapshot = await documentReference.get();
    // print(documentSnapshot);
    // Map<String, dynamic>? data =
    //     documentSnapshot.data() as Map<String, dynamic>?;
    // print(data);
    // return data as Map<String, dynamic>;
    return downloadUrl as String;
  }

  FiGet_All_info_with_student_id(
      String student_id, String garde, String subject) async {
    print("## student_id ${student_id}");
    // /Homework/Grade 1/عربي/NY63UvWuWPWfjzutq745/Solve/S1
    //                                                   doc
    CollectionReference collection = FirebaseFirestore.instance
        .collection('Homework')
        .doc(garde)
        .collection(subject);

    QuerySnapshot querySnapshot = await collection.get();
    // hh@gmail.com
    // print("## ddaadd ${ddaadd}");
    List<dynamic> out_list = [];
    for (var doc in querySnapshot.docs) {
      print("##doc* ${doc.id}");
      print("## doc['title'] ${doc["title"]}");
      print("## doc['body'] ${doc['body']}");
      try {
        var collection0 = collection.doc("${doc.id}").collection('Solve');
        var querySnapshot = await collection0.get();
        // print({querySnapshot});
        print("## querySnapshot.docs.length ${querySnapshot.docs.length}");
        if (querySnapshot.docs.length == 0) {
          out_list.add([
            doc.id,
            doc["title"],
            doc['body'],
            doc['files'],
            doc['score'],
          ]);
          continue;
        }
        bool ioSolve = false;
        for (var doc0 in querySnapshot.docs) {
          print("## doc0 ${doc0.id}");
          if (doc0.id == student_id) ioSolve = true;
        }
        if (ioSolve) {
          ioSolve = false;
          var collection01 = await collection
              .doc("${doc.id}")
              .collection('Solve')
              .doc(student_id)
              .get();
          Map<String, dynamic>? data =
              collection01.data() as Map<String, dynamic>?;

          out_list.add([
            doc.id,
            doc["title"],
            doc['body'],
            doc['files'],
            doc['score'],
            data?["body"],
            data?["files"],
            data?["score"]
            // doc.id
          ]);
        } else {
          out_list.add([
            doc.id,
            doc["title"],
            doc['body'],
            doc['files'],
            doc['score'],
          ]);
        }
      } catch (e) {
        print("##not-solve");
      }
    }
    print("##out_list ${out_list}");
    return out_list;
  }

  FiAdd_score_and_comment(String garde, String subject, String Hw_id,
      String St_id, String comment, String score) async {
    ///Homework/Grade 1/عربي/NY63UvWuWPWfjzutq745/Solve/S1
    print("-${garde}-${subject}-${Hw_id}-${St_id}-${comment}-${score}");
    try {
      // DatabaseReference ref = FirebaseDatabase.instance 1
      //     .ref("Homework/${garde}/${subject}/${Hw_id}/Solve/${St_id}");

      DocumentReference documentReference = fire
          .collection('Homework')
          .doc("${garde}")
          .collection("${subject}")
          .doc("${Hw_id}")
          .collection("Solve")
          .doc("${St_id}");

      print("waselttt");
      await documentReference.update({"score": score, "comment": comment});
      return true;
    } catch (e) {
      return e;
    }
    //pass
  }

  // Storage
  stHwStore(var file) async {
    if (file.length != 0) {
      if (file.length > 1) {
        List<String> outList = [];
        for (var file in file) {
          print(file);
          List<String> name = file.toString().split("/");
          String fileName = name[name.length - 1].replaceAll("'", "");
          var snapshot =
              await storage.ref().child('Homeworks/$fileName').putFile(file);
          var downloadUrl = await snapshot.ref.getDownloadURL();
          outList.add(downloadUrl);
        }
        return outList;
      } else {
        print(file[0]);
        List<String> name = file[0].toString().split("/");
        String fileName = name[name.length - 1].replaceAll("'", "");
        var snapshot =
            await storage.ref().child('Homeworks/$fileName').putFile(file[0]);
        var downloadUrl = await snapshot.ref.getDownloadURL();
        return [downloadUrl];
      }
    } else {
      print("emty files");
    }
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
