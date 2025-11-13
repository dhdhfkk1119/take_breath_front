import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:take_breath/_core/utils/closable_info_box.dart';
import 'package:take_breath/_core/utils/widgets_app_bar.dart';

class UserReportAssistantPage extends StatefulWidget {
  const UserReportAssistantPage({Key? key}) : super(key: key);

  @override
  State<UserReportAssistantPage> createState() =>
      _UserReportAssistantPageState();
}

class _UserReportAssistantPageState extends State<UserReportAssistantPage> {
  bool _isDownloading = false;
  double _downloadProgress = 0.0;

  void _handleDownload() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text(
            '신고 자료 다운로드',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: const Text(
            '지금까지 기록하신 기록실에 대한 내용 및 사진, 녹화 등이 현재 핸드폰 기준으로 다운로드 됩니다.',
            style: TextStyle(
              fontSize: 13,
              height: 1.5,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                '취소',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _startDownload();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                '확인',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _startDownload() async {
    setState(() {
      _isDownloading = true;
      _downloadProgress = 0.0;
    });

    try {
      // 백엔드 API 호출 (실제 구현 시)
      // final response = await http.get(
      //   Uri.parse('https://your-api.com/download-records'),
      //   headers: {
      //     'Authorization': 'Bearer $token',
      //   },
      // );

      // 시뮬레이션: 다운로드 진행률 업데이트
      for (int i = 0; i <= 100; i += 10) {
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          _downloadProgress = i / 100;
        });
      }

      // 파일 저장 (실제 구현 시 path_provider, file 패키지 사용)
      // final directory = await getApplicationDocumentsDirectory();
      // final file = File('${directory.path}/신고자료_${DateTime.now()}.zip');
      // await file.writeAsBytes(response.bodyBytes);

      setState(() {
        _isDownloading = false;
      });

      // 다운로드 완료 메시지
      if (mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              title: const Text(
                '다운로드 완료',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              content: const Text(
                '신고 자료가 성공적으로 다운로드되었습니다.\n\n파일 위치: 내 파일 > 신고자료 폴더',
                style: TextStyle(
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('확인'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      setState(() {
        _isDownloading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('다운로드 실패: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsAppBar(
        title: '신고 도우미',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 소개 섹션
              ClosableInfoBox(
                noticeTitle: '신고 도우미란?',
                title1:
                    '지금까지 기록실에 저장하신 모든 기록, 사진, 음성파일 등을 한 번에 다운로드하여 신고 시 증거자료로 사용할 수 있습니다.',
              ),
              const SizedBox(height: 24),
              // 다운로드 내용
              const Text(
                '다운로드 포함 항목',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              _buildIncludeItem(
                icon: CupertinoIcons.doc_text,
                title: '기록 내용',
                description: '기록실에 저장된 모든 텍스트 기록',
              ),
              const SizedBox(height: 8),
              _buildIncludeItem(
                icon: CupertinoIcons.photo_on_rectangle,
                title: '사진',
                description: '촬영하거나 업로드한 모든 사진',
              ),
              const SizedBox(height: 8),
              _buildIncludeItem(
                icon: CupertinoIcons.video_camera,
                title: '동영상',
                description: '녹화하거나 업로드한 모든 동영상',
              ),
              const SizedBox(height: 8),
              _buildIncludeItem(
                icon: CupertinoIcons.music_note,
                title: '음성파일',
                description: '녹음하거나 업로드한 모든 음성파일',
              ),
              const SizedBox(height: 24),
              // 주의사항
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange[200]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.exclamationmark_circle,
                          color: Colors.orange[700],
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '주의사항',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.orange[700],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '• 다운로드 파일은 ZIP 형식으로 압축됩니다\n• 용량이 클 수 있으니 충분한 저장공간을 확보하세요\n• 다운로드된 파일은 중요한 증거자료이니 백업을 권장합니다',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.orange[900],
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // 다운로드 진행 상황
              if (_isDownloading)
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: _downloadProgress,
                        minHeight: 8,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.teal[400]!,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '${(_downloadProgress * 100).toStringAsFixed(0)}% 다운로드 중...',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              // 다운로드 버튼
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _isDownloading ? null : _handleDownload,
                  icon: const Icon(CupertinoIcons.cloud_download),
                  label: const Text(
                    '신고 자료 다운로드',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    disabledBackgroundColor: Colors.grey[300],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIncludeItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: Colors.teal,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
