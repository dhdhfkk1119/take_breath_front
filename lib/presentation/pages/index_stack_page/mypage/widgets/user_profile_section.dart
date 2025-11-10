import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/member/providers/member_login_notifier.dart';

import '../../../../../_core/utils/my_http.dart';


class UserProfileSection extends ConsumerWidget {
  final VoidCallback onEditPressed;

  const UserProfileSection({
    Key? key,
    required this.onEditPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final notifier = ref.watch(memberProvider);

    if (notifier == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamed(context, "/social_page");
      });
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      color: Colors.grey[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 프로필 사진
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
            child: notifier.profileImage != null && notifier.profileImage!.isNotEmpty
                ? ClipOval(
              child: Image.network(
                // notifier.profileImage!
                '$imageLocalUrl/uploads/${notifier.profileImage!}',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    CupertinoIcons.person_fill,
                    size: 40,
                    color: Colors.grey,
                  );
                },
              ),
            )
                : const Icon(
              CupertinoIcons.person_fill,
              size: 40,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 12),
          // 이름
          Text(
            notifier.nickName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            notifier.email,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          // 정보수정 버튼 (파란색)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onEditPressed,
              icon: const Icon(CupertinoIcons.pencil, size: 16),
              label: const Text(
                '정보수정',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[400],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
