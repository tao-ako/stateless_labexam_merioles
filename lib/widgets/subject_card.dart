import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key,
    required this.subject,
    required this.instructor,
    required this.schedule,
  });

  final String subject;
  final String instructor;
  final String schedule;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subject,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            instructor,
            style: const TextStyle(color: Color(0xFF777777), fontSize: 13),
          ),
          const SizedBox(height: 2),
          Text(
            schedule,
            style: const TextStyle(color: Color(0xFF777777), fontSize: 13),
          ),
        ],
      ),
    );
  }
}
