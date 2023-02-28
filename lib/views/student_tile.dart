import 'package:devtools_flutter/business/student_list_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentTile extends StatelessWidget {
  const StudentTile({
    Key? key,
    required this.id,
    required this.avatarPath,
    required this.firstName,
    required this.lastName,
    required this.gpa,
    required this.activist,
  }) : super(key: key);
  final int id;
  final String avatarPath;
  final String firstName;
  final String lastName;
  final double gpa;
  final bool activist;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(avatarPath),
            SizedBox(
              width: 150,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      firstName,
                      style: const TextStyle(fontSize: 21),
                    ),
                    Text(
                      lastName,
                      style: const TextStyle(fontSize: 21),
                    ),
                    Text(
                      gpa.toString(),
                      style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    )
                  ]),
            ),
            Switch(
              value: activist,
              activeColor: Colors.greenAccent,
              onChanged: (bool value) {
                context.read<StudentListState>().changeStudentActivism(id);
              },
            )
          ],
        ),
      ),
    );
  }
}
