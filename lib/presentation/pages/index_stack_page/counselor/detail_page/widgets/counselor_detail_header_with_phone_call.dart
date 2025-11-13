import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/chat/providers/chat_room_repository_provider.dart';
import 'package:take_breath/domain/counselor/models/counselor_response.dart';
import 'package:take_breath/presentation/pages/index_stack_page/chat/chat_detail/chat_detail_page.dart';
import 'package:url_launcher/url_launcher.dart';

class CounselorDetailHeader extends ConsumerStatefulWidget {
  final CounselorResponse counselor;

  const CounselorDetailHeader({
    Key? key,
    required this.counselor,
  }) : super(key: key);

  @override
  ConsumerState<CounselorDetailHeader> createState() =>
      _CounselorDetailHeaderState();
}

class _CounselorDetailHeaderState extends ConsumerState<CounselorDetailHeader> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = false;
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    try {
      await launchUrl(launchUri);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('전화를 걸 수 없습니다: $e')),
      );
    }
  }

  Future<void> _createConsultationRoom() async {
    try {
      final repository = ref.read(chatRoomRepositoryProvider);
      final response = await repository.createConsultationRoom(
        consultantId: widget.counselor.id!,
      );

      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailPage(
              roomId: response.roomId,
              roomName: response.roomName,
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('상담방 생성 실패: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 배경 이미지
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.amber[100]!, Colors.brown[300]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        // 프로필 섹션
        Transform.translate(
          offset: const Offset(0, -50),
          child: Column(
            children: [
              // 프로필 사진
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                  border: Border.all(
                    color: Colors.white,
                    width: 4,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  CupertinoIcons.person_fill,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 12),
              // 뱃지
              // 이름
              Text(
                widget.counselor.name ?? "없음",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              // 자격증
              Text(
                widget.counselor.specialty ?? "없음",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                // 💡 리스트에서 자격증 이름만 추출하여 쉼표와 공백으로 연결
                widget.counselor.licenses != null &&
                        widget.counselor.licenses!.isNotEmpty
                    ? widget.counselor.licenses!
                        .map((license) => license
                            .licenseName) // CounselorLicenseResponse 객체에서 'name' 필드 추출
                        .join(', ') // 추출된 이름들을 ', '로 연결
                    : "자격증 없음", // 리스트가 null이거나 비어있을 경우
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 16),
              // 인포 박스
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildInfoBox('인간관계', '4,915'),
                    _buildInfoBox('친절성', '3,271'),
                    _buildInfoBox('전문성', '2,154'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // 버튼
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _createConsultationRoom,
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.grey),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          '문자 상담',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _makePhoneCall('01012345678');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[400],
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          '전화 상담',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoBox(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
