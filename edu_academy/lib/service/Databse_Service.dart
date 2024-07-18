import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final real = FirebaseDatabase.instance;

  rlCreate(String rref, userData) async {
    final allStudents = await real.ref(rref).once();
    int num_s = allStudents.snapshot.children.length;
    log(num_s.toString());
    try {
      real.ref(rref).child("${rref[0]}${(num_s + 1).toString()}").set(userData);
    } catch (e) {
      log(e.toString());
    }
  }

  rlRead_ForLogin() async {
    try {
      final allData = await real.ref().once();
      log(allData.snapshot.value.toString());
      log(allData.snapshot.children.toList()[0].value.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
