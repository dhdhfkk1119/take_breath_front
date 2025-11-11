import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/_core/utils/thumbnail_image.dart';
import 'package:take_breath/domain/counselor/models/counselor_response.dart';
import 'package:take_breath/domain/counselor/providers/counselor_list_notifier.dart';

class CounselorItem extends ConsumerStatefulWidget {
  final CounselorResponse counselor;
  final VoidCallback onTap;

  const CounselorItem({
    Key? key,
    required this.counselor,
    required this.onTap,
  }) : super(key: key);

  @override
  ConsumerState<CounselorItem> createState() => _CounselorItemState();
}

class _CounselorItemState extends ConsumerState<CounselorItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final counselorListState = ref.watch(counselorListProvider);
    final updatedCounselor = counselorListState.data?.content.firstWhere(
      (c) => c.id == widget.counselor.id,
      orElse: () => widget.counselor,
    );

    final isLiked = updatedCounselor?.likedByMe ?? false;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 프로필 사진
                  ThumbnailImage(
                    url: "${baseUrl}/uploads/${widget.counselor.profileImage}",
                    width: 80,
                    height: 80,
                    borderRadius: 15,
                  ),
                  const SizedBox(width: 16),
                  // 이름, 자격증
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.counselor.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.counselor.licenses != null &&
                                  widget.counselor.licenses!.isNotEmpty
                              ? widget.counselor.licenses!
                                  .map((license) => license.licenseName)
                                  .join(', ')
                              : "자격증 없음",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.counselor.hashtags ?? "해시태그",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  // 찜 버튼
                  GestureDetector(
                    onTap: () async {
                      await ref
                          .read(counselorListProvider.notifier)
                          .toggleLike(widget.counselor.id);
                    },
                    child: Icon(
                      isLiked
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      color: isLiked ? Colors.red : Colors.grey[400],
                      size: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // 설명
              Text(
                widget.counselor.introduction ?? "등록된 글이 없습니다",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              // 구분선
              Divider(
                color: Colors.grey[200],
                height: 1,
              ),
              const SizedBox(height: 12),
              // 가격 정보
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 상담료
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          //여기 문자를 주고받는 로직 추가 부탁
                        },
                        child: Text(
                          '문자 상담',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.teal[50],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Icon(
                              CupertinoIcons.chat_bubble_text_fill,
                              size: 14,
                              color: Colors.teal[700],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '1000만',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // 후기료
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '문자 상담',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[500],
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange[50],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Icon(
                              CupertinoIcons.phone_fill,
                              size: 14,
                              color: Colors.orange[700],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '1000만',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
