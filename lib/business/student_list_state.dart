import 'package:devtools_flutter/data/students_list.dart';
import 'package:flutter/material.dart';

import '../data/model/student.dart';

class StudentListState with ChangeNotifier {
  final List<Student> _students = studentsList;

  List<Student> get students => _students;

  void changeStudentActivism(int id) {
    final studentIndex = _students.indexWhere((student) => student.id == id);
    if (studentIndex != -1) {
      _students[studentIndex] = _students[studentIndex].copyWith(isActivist: !_students[studentIndex].isActivist);
      notifyListeners();
    }
  }
}
