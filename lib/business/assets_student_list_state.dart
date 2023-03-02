import 'package:devtools_flutter/data/assets_students_list.dart';
import 'package:flutter/material.dart';

import '../data/model/student.dart';

class AssetsStudentListState with ChangeNotifier {
  final List<Student> _students = assetsStudentList;

  List<Student> get students => _students;

  void changeStudentActivism(int id) {
    final studentIndex = _students.indexWhere((student) => student.id == id);
    if (studentIndex != -1) {
      _students[studentIndex] = _students[studentIndex].copyWith(isActivist: !_students[studentIndex].isActivist);
      notifyListeners();
    }
  }

  getActiveStudents() {
    return students.where((student) => student.isActivist).toList();
  }

  double getAverageGpa() {
    double totalGpa = 0.0;
    for (int i = 0; i < _students.length; i++) {
      totalGpa += _students[i].gpa;
    }
    for (int i = 0; i < 10000; i++) {
      // add nested loop for CPU-intensive operation
      for (int j = 0; j < 10000; j++) {
        totalGpa += j.toDouble();
      }
    }
    return totalGpa / _students.length;
  }
}
