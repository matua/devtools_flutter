import 'package:devtools_flutter/business/network_student_list_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../business/assets_student_list_state.dart';
import '../data/model/student.dart';
import '../views/student_tile.dart';
import '../config/config.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  List<Student> students = [];
  List<Student> activeStudents = [];

  @override
  Widget build(BuildContext context) {
    if (isNetworkEnabled) {
      students = context.watch<NetworkStudentListState>().students;
      activeStudents = context.watch<NetworkStudentListState>().getActiveStudents();
    } else {
      students = context.watch<AssetsStudentListState>().students;
      activeStudents = context.watch<AssetsStudentListState>().getActiveStudents();
    }

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.person),
              ),
              Tab(
                icon: Icon(Icons.handyman),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) => StudentTile(
                    id: students[index].id,
                    firstName: students[index].firstName,
                    lastName: students[index].lastName,
                    gpa: students[index].gpa,
                    avatarPath: students[index].avatarPath,
                    activist: students[index].isActivist,
                  )),
          ListView.builder(
              itemCount: activeStudents.length,
              itemBuilder: (context, index) => StudentTile(
                    id: activeStudents[index].id,
                    firstName: activeStudents[index].firstName,
                    lastName: activeStudents[index].lastName,
                    gpa: activeStudents[index].gpa,
                    avatarPath: activeStudents[index].avatarPath,
                    activist: activeStudents[index].isActivist,
                  )),
        ]),
      ),
    );
  }
}
