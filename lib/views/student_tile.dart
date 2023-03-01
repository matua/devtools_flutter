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
          Expanded(flex: 1, child: Image.asset(avatarPath)),
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
                MyStream()._initializeStream();
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

class MyStream {
  final _controller = StreamController<HeavyObject>.broadcast();

  Stream<HeavyObject> get stream => _controller.stream;

  MyStream() {
    _initializeStream();
  }

  void _initializeStream() async {
    for (int i = 0; i < 10000000; i++) {
      // Simulate asynchronous data being added to the stream
      await Future.delayed(const Duration(milliseconds: 1000));
      HeavyObject heavyObject = HeavyObject(i);
      heavyObject.computeHeavyOperation();
      // Add the data to the streamadd
      _controller.sink.add(heavyObject);
    }

    // Close the stream once all data has been added
    // _controller.close();
  }
}

class HeavyObject {
  final int number;
  final List<int> _data;

  HeavyObject(this.number) : _data = List.generate(10000000, (i) => i);

  int computeHeavyOperation() {
    // Perform a heavy computation using the data
    return _data.fold(0, (sum, value) => sum + value);
  }
}
