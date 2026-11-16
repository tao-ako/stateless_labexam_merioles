import 'package:flutter/material.dart';
import '../models/student_profile_data.dart';

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key, required this.profile});

  final StudentProfileData profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundColor: Color(0xFFEDE9F8),
          child: Icon(
            Icons.person_rounded,
            size: 46,
            color: Color(0xFF8273B5),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  height: 1.15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                profile.studentId,
                style: const TextStyle(
                  color: Color(0xFF777777),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                profile.course,
                style: const TextStyle(
                  color: Color(0xFF777777),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
