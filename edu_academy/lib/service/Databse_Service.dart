import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final real = FirebaseDatabase.instance;

  rlCreate(userData) async {
    
    final allStudents = await real.ref("students").once();
    int num_s = allStudents.snapshot.children.length;
    try {
      real.ref("students").child("S${(num_s + 1).toString()}").set(userData);
    } catch (e) {
      log(e.toString());
    }
  }
}
