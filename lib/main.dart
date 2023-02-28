import 'package:devtools_flutter/business/student_list_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/students_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StudentListState>(
      create: (_) => StudentListState(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: StudentsPage(
          title: 'Students Page',
        ),
      ),
    );
  }
}
