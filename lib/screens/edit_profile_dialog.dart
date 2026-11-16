import 'package:flutter/material.dart';
import '../models/student_profile_data.dart';

class EditProfileDialog extends StatefulWidget {
  const EditProfileDialog({super.key, required this.profile});

  final StudentProfileData profile;

  @override
  State<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _studentIdController;
  late final TextEditingController _courseController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profile.name);
    _studentIdController = TextEditingController(
      text: widget.profile.studentId,
    );
    _courseController = TextEditingController(text: widget.profile.course);
    _emailController = TextEditingController(text: widget.profile.email);
    _phoneController = TextEditingController(text: widget.profile.phone);
    _addressController = TextEditingController(text: widget.profile.address);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _studentIdController.dispose();
    _courseController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit profile'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _ProfileField(label: 'Full name', controller: _nameController),
            _ProfileField(
              label: 'Student ID',
              controller: _studentIdController,
            ),
            _ProfileField(
              label: 'Course and year',
              controller: _courseController,
            ),
            _ProfileField(
              label: 'Email address',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            _ProfileField(
              label: 'Contact number',
              controller: _phoneController,
              keyboardType: TextInputType.phone,
            ),
            _ProfileField(
              label: 'Home address',
              controller: _addressController,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            Navigator.pop(
              context,
              widget.profile.copyWith(
                name: _nameController.text.trim(),
                studentId: _studentIdController.text.trim(),
                course: _courseController.text.trim(),
                email: _emailController.text.trim(),
                phone: _phoneController.text.trim(),
                address: _addressController.text.trim(),
              ),
            );
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}

class _ProfileField extends StatelessWidget {
  const _ProfileField({
    required this.label,
    required this.controller,
    this.keyboardType,
  });

  final String label;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          isDense: true,
        ),
      ),
    );
  }
}
