class StudentProfileData {
  const StudentProfileData({
    required this.name,
    required this.studentId,
    required this.course,
    required this.email,
    required this.phone,
    required this.address,
  });

  final String name;
  final String studentId;
  final String course;
  final String email;
  final String phone;
  final String address;

  StudentProfileData copyWith({
    String? name,
    String? studentId,
    String? course,
    String? email,
    String? phone,
    String? address,
  }) {
    return StudentProfileData(
      name: name ?? this.name,
      studentId: studentId ?? this.studentId,
      course: course ?? this.course,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }
}
