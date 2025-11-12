import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../domain/counselor/models/counselor_response.dart';
import '../../../counselor/detail_page/counselor_detail_page.dart';

class CounselorCard extends StatelessWidget {
  final CounselorResponse counselor;

  const CounselorCard({Key? key, required this.counselor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CounselorDetailPage(counselor: counselor),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            // 프로필 이미지
            _buildProfileImage(),
            const SizedBox(width: 12),
            // 상담사 정보
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 이름 & 좋아요
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        counselor.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.heart_fill,
                            size: 14,
                            color: Colors.red[400],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${counselor.likeCount}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // 전문분야
                  if (counselor.specialty != null &&
                      counselor.specialty!.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        counselor.specialty!,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.blue[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  const SizedBox(height: 8),
                  // 소개
                  if (counselor.introduction != null &&
                      counselor.introduction!.isNotEmpty)
                    Text(
                      counselor.introduction!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: 8),
                  // 해시태그
                  if (counselor.hashtags != null &&
                      counselor.hashtags!.isNotEmpty)
                    Text(
                      counselor.hashtags!.join(' '),
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[600],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: 8),
                  // 가격
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.money_dollar_circle,
                        size: 14,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${counselor.price}P / 회기',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child:
      counselor.profileImage != null && counselor.profileImage!.isNotEmpty
          ? ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          counselor.profileImage!,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _buildDefaultAvatar();
          },
        ),
      )
          : _buildDefaultAvatar(),
    );
  }

  Widget _buildDefaultAvatar() {
    return Icon(
      CupertinoIcons.person_fill,
      size: 40,
      color: Colors.grey[400],
    );
  }
}
