class Student {
  final int id;
  final String avatarPath;
  final String firstName;
  final String lastName;
  final double gpa;
  final bool isActivist;

  Student({
    required this.id,
    required this.avatarPath,
    required this.firstName,
    required this.lastName,
    required this.gpa,
    required this.isActivist,
  });

  Student copyWith({
    int? id,
    String? avatarPath,
    String? firstName,
    String? lastName,
    double? gpa,
    bool? isActivist,
  }) {
    return Student(
      id: id ?? this.id,
      avatarPath: avatarPath ?? this.avatarPath,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gpa: gpa ?? this.gpa,
      isActivist: isActivist ?? this.isActivist,
    );
  }
}
