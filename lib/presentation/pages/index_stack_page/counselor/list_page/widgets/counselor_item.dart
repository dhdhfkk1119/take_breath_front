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
    final isLiked = counselorListState.data?.content
            .firstWhere(
              (c) => c.id == widget.counselor.id,
              orElse: () => widget.counselor,
            )
            .likedByMe ??
        widget.counselor.likedByMe;

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
                          "${widget.counselor.gender}" ?? "설정안함",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
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
                          widget.counselor.hashtags != null &&
                                  widget.counselor.hashtags!.isNotEmpty
                              ? widget.counselor.hashtags!.join(' ')
                              : "해시태그",
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
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        isLiked!
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        key: ValueKey(isLiked),
                        color: isLiked ? Colors.red : Colors.grey[400],
                        size: 24,
                      ),
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
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '정보',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[500],
                        ),
                      ),
                      const SizedBox(height: 2),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '보유 자격증 갯수 : ${widget.counselor.licenses?.length ?? "1"}개',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '외부 상담 평균 가격 : ${widget.counselor.price}원',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
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
