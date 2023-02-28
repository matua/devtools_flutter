import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../business/student_list_state.dart';
import '../data/model/student.dart';
import '../views/student_tile.dart';

class StudentsPage extends StatelessWidget {
  StudentsPage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final List<Student> students = context.watch<StudentListState>().students;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) => StudentTile(
                id: students[index].id,
                firstName: students[index].firstName,
                lastName: students[index].lastName,
                gpa: students[index].gpa,
                avatarPath: students[index].avatarPath,
                activist: students[index].isActivist,
              )),
    );
  }
}
