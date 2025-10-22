import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/counselor_model.dart';

class CounselorItem extends StatefulWidget {
  final CounselorModel counselor;
  final VoidCallback onTap;

  const CounselorItem({
    Key? key,
    required this.counselor,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CounselorItem> createState() => _CounselorItemState();
}

class _CounselorItemState extends State<CounselorItem> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.counselor.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
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
              // 상단: 프로필, 이름, 찜
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 프로필 사진
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      CupertinoIcons.person_fill,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // 이름, 자격증
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 뱃지 + 이름
                        Row(
                          children: [
                            if (widget.counselor.badge.isNotEmpty)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.orange[100],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  widget.counselor.badge,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.orange[700],
                                  ),
                                ),
                              ),
                            const SizedBox(width: 8),
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
                        // 자격증
                        Text(
                          widget.counselor.specialty,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 찜 버튼
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Icon(
                      isFavorite
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      color: isFavorite ? Colors.red : Colors.grey[400],
                      size: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // 설명
              Text(
                widget.counselor.description,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 상담료
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
                            '${widget.counselor.consultFee ~/ 1000}만',
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
                        '전화 상담',
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
                            '${widget.counselor.reviewFee ~/ 1000}만',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // 예약 버튼
                  const Text(
                    '-',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
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
