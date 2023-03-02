import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../business/assets_student_list_state.dart';
import '../config/config.dart';

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
    ImageProvider imageProvider;
    if (isNetworkEnabled) {
      imageProvider = NetworkImage("https://picsum.photos/id/$id/300/300");
    } else {
      imageProvider = AssetImage(avatarPath);
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Image(image: imageProvider),
          ),
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
                context.read<AssetsStudentListState>().changeStudentActivism(id);
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
