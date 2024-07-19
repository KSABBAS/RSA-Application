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

  rlRead_ForLogin(String input, String password) async {
    try {
      input = input.trim();
      password = password.trim();
      
      final allData = await real.ref().once();
      // log(allData.snapshot.value.toString());

      if (allData.snapshot.value != null) {
        Map<dynamic, dynamic> data = allData.snapshot.value as Map<dynamic, dynamic>;

        bool userFound = false;

        if (data['Students'] != null) {
          data['Students'].forEach((key, value) {
            String email = (value['email'] ?? '').toString().trim();
            String phone = (value['phone'] ?? '').toString().trim();
            String storedPassword = (value['password'] ?? '').toString().trim();
            if ((email == input || phone == input) && storedPassword == password) {
              userFound = true;
              log('Login successful as Student: $key');
              return 'Login successful as Student: $key';
            }
          });
        }

        if (!userFound && data['Parent'] != null) {
          data['Parent'].forEach((key, value) {
            String email = (value['email'] ?? '').toString().trim();
            String phone = (value['phone'] ?? '').toString().trim();
            String storedPassword = (value['password'] ?? '').toString().trim();
            if ((email == input || phone == input) && storedPassword == password) {
              userFound = true;
              log('Login successful as Parent: $key');
              return 'Login successful as Parent: $key';
            }
          });
        }

        if (!userFound && data['Teacher'] != null) {
          data['Teacher'].forEach((key, value) {
            String email = (value['email'] ?? '').toString().trim();
            String phone = (value['phone'] ?? '').toString().trim();
            String storedPassword = (value['password'] ?? '').toString().trim();
            if ((email == input || phone == input) && storedPassword == password) {
              userFound = true;
              log('Login successful as Teacher: $key');
              return 'Login successful as Teacher: $key';
            }
          });
        }

        if (!userFound) {
          log('Login failed: Invalid email/phone or password');
          return 'Login failed: Invalid email/phone or password';
        }
      } else {
        log('Error: Data is null');
        return 'Error: Data is null';
      }

      return 'Unexpected error';
      } catch (e) {
      log(e.toString());
    }
  }
}
