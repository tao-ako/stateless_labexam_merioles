import 'package:flutter/material.dart';

class ContactInformationCard extends StatelessWidget {
  const ContactInformationCard({
    super.key,
    required this.email,
    required this.phone,
    required this.address,
  });

  final String email;
  final String phone;
  final String address;

  @override
  Widget build(BuildContext context) {
    final rows = [
      (Icons.email_outlined, email),
      (Icons.phone_outlined, phone),
      (Icons.home_outlined, address),
    ];

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          for (var index = 0; index < rows.length; index++) ...[
            _ContactRow(icon: rows[index].$1, text: rows[index].$2),
            if (index < rows.length - 1)
              const Divider(height: 1, color: Color(0xFFD8D8D8)),
          ],
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 54),
      child: Row(
        children: [
          Icon(icon, size: 20, color: const Color(0xFF777777)),
          const SizedBox(width: 13),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF444444),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
