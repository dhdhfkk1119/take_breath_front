import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/thumbnail_image.dart';
import 'package:take_breath/domain/community/models/community_list.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/detail_page/community_detail_page.dart';

class CommunityListItem extends ConsumerWidget {
  final CommunityList post;

  const CommunityListItem({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        // 게시물 상세 페이지로 이동
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CommunityDetailPage(
              id: post.id,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Row(
          children: [
            ThumbnailImage(url: post.thumbnail, width: 100, height: 100),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1시간',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    post.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${post.memberName} | ${post.createdAt}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
