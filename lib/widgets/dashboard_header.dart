import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget implements PreferredSizeWidget {
  const DashboardHeader({super.key, required this.onLogout});

  final VoidCallback onLogout;

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 72,
      titleSpacing: 22,
      title: const Text(
        'Student Dashboard',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            debugPrint('Logout clicked');
            onLogout();
          },
          tooltip: 'Log out',
          icon: const Icon(Icons.logout_rounded),
          color: const Color(0xFF333333),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
