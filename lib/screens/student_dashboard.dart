import 'package:flutter/material.dart';
import '../models/student_profile_data.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/contact_information_card.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/student_profile.dart';
import '../widgets/subject_card.dart';
import 'edit_profile_dialog.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  StudentProfileData _profile = const StudentProfileData(
    name: 'Kevin Loyd T. Merioles',
    studentId: '537327',
    course: 'BSIT 3RD YEAR',
    email: 'k.merioles.537327@umindanao.edu.ph',
    phone: '09922310041',
    address: 'Purok 37, NHA Ma-a, Davao City',
  );
  bool _isTabSelected = true;

  Future<void> _confirmLogout() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log out?'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Log out'),
          ),
        ],
      ),
    );

    if (shouldLogout == true && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logout confirmed.')),
      );
    }
  }

  Future<void> _editProfile() async {
    final updatedProfile = await showDialog<StudentProfileData>(
      context: context,
      builder: (context) => EditProfileDialog(profile: _profile),
    );

    if (updatedProfile != null && mounted) {
      setState(() => _profile = updatedProfile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashboardHeader(onLogout: _confirmLogout),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        children: [
          StudentProfile(profile: _profile),
          const SizedBox(height: 22),
          ContactInformationCard(
            email: _profile.email,
            phone: _profile.phone,
            address: _profile.address,
          ),
          const SizedBox(height: 24),
          const Text(
            'Subjects',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          const SubjectCard(
            subject: 'Mobile App Development',
            instructor: 'Miko Velez',
            schedule: 'Mon/Wed 10:00 – 11:30 AM',
          ),
          const SizedBox(height: 12),
          const SubjectCard(
            subject: 'Database Systems',
            instructor: 'Miko Velez',
            schedule: 'Tue/Thu 1:00 – 2:30 PM',
          ),
          const SizedBox(height: 12),
          const SubjectCard(
            subject: 'Operating Systems',
            instructor: 'Miko Velez',
            schedule: 'Fri 8:00 – 11:00 AM',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _editProfile,
        tooltip: 'Edit profile',
        backgroundColor: const Color(0xFFF1EDFF),
        foregroundColor: const Color(0xFF7763C1),
        elevation: 5,
        shape: const CircleBorder(),
        child: const Icon(Icons.edit_outlined),
      ),
      bottomNavigationBar: DashboardBottomNavigation(
        isSelected: _isTabSelected,
        onTap: () => setState(() => _isTabSelected = true),
      ),
    );
  }
}
