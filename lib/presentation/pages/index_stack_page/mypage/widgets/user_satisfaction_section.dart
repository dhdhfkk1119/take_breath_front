import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UserProfileSection extends StatelessWidget {
  final VoidCallback onEditPressed;

  const UserProfileSection({
    Key? key,
    required this.onEditPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.grey[50],
      child: Column(
        children: [
          // 프로필 사진
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
              border: Border.all(
                color: Colors.grey[200]!,
                width: 2,
              ),
            ),
            child: const Icon(
              CupertinoIcons.person_fill,
              size: 40,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 12),
          // 닉네임
          const Text(
            '바쁜일당',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          // ID
          Text(
            '#zsswle5',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          // 버튼
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onEditPressed,
              icon: const Icon(CupertinoIcons.pencil),
              label: const Text('정보수정'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[400],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
