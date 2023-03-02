import 'package:devtools_flutter/business/assets_student_list_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'business/network_student_list_state.dart';
import 'views/students_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AssetsStudentListState>(
          create: (_) => AssetsStudentListState(),
        ),
        ChangeNotifierProvider<NetworkStudentListState>(
          create: (_) => NetworkStudentListState(),
        ),
      ],
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
