import 'package:flutter/material.dart';

import '../data/model/student.dart';

class NetworkStudentListState with ChangeNotifier {
  final List<Student> _students = createNetworkStudentList();

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
}

List<Student> createNetworkStudentList() {
  final List<Student> students = [];
  for (int id = 1; id <= 105; id++) {
    final String avatarPath = 'https://picsum.photos/id/$id/300/300';
    final String firstName = 'John_$id';
    final String lastName = 'Simth_$id';
    final double gpa = 5 + (id % 6) + (id / 100);
    const bool isActivist = false;

    students.add(Student(
      id: id,
      avatarPath: avatarPath,
      firstName: firstName,
      lastName: lastName,
      gpa: gpa,
      isActivist: isActivist,
    ));
  }
  return students;
}
