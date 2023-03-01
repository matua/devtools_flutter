import 'dart:async';

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 1, child: Image.network("https://picsum.photos/id/$id/300/300")),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
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
          ),
          Expanded(
            flex: 1,
            child: Switch(
              value: activist,
              activeColor: Colors.greenAccent,
              onChanged: (_) {
                context.read<StudentListState>().changeStudentActivism(id);
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text('Student is now ${activist ? "not active" : "active"}'),
                          ],
                        ),
                      ),
                    );
                  },
                );
                Future.delayed(const Duration(milliseconds: 500), () {
                  Navigator.of(context).pop();
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
