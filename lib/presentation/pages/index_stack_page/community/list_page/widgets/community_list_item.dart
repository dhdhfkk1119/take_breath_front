import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/formatTime.dart';
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
                    FormatTime.beforeFormat(post.createdAt),
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 8,
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
                    '${post.memberName} | ${FormatTime.createFormat(post.createdAt)}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      likeCount(post),
                      const SizedBox(width: 4),
                      commentCount(post),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget likeCount(CommunityList post) {
    return Row(
      children: [
        post.liked
            ? Icon(CupertinoIcons.heart_fill, size: 14, color: Colors.redAccent)
            : Icon(CupertinoIcons.heart, size: 14, color: Colors.redAccent),
        const SizedBox(width: 2),
        Text('${post.likeCount}',
            style: TextStyle(color: Colors.grey[600], fontSize: 13)),
      ],
    );
  }

  Widget commentCount(CommunityList detail) {
    return Row(
      children: [
        Icon(CupertinoIcons.chat_bubble_text_fill,
            size: 14, color: Colors.grey[600]),
        const SizedBox(width: 2),
        Text('${detail.commentCount}',
            style: TextStyle(color: Colors.grey[600], fontSize: 13)),
      ],
    );
  }
}
