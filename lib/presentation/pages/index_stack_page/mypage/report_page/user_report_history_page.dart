import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UserReportHistoryPage extends StatelessWidget {
  const UserReportHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 임시 데이터 (실제로는 서버에서 가져옴)
    final List<Map<String, dynamic>> reports = [
      {
        'id': 1,
        'status': '처리중',
        'date': '2024.01.22',
        'reportType': '직장 내 괴롭힘',
        'title': '상사의 부당한 언어폭력',
        'description': '팀회의 중 상사로부터 모욕적인 발언을 받았습니다.',
        'reportedUser': '김팀장',
        'evidence': '녹음파일, 메시지 기록',
      },
      {
        'id': 2,
        'status': '완료',
        'date': '2024.01.18',
        'reportType': '과도한 업무 강요',
        'title': '야근 강요 및 휴일 없음',
        'description': '월 100시간 이상의 야근을 강요받고 있습니다.',
        'reportedUser': '이상무',
        'evidence': '근무 기록, 증인 있음',
      },
      {
        'id': 3,
        'status': '조사중',
        'date': '2024.01.15',
        'reportType': '성희롱',
        'title': '성적 괴롭힘',
        'description': '동료로부터 지속적인 성적 수치심을 주는 말을 듣고 있습니다.',
        'reportedUser': '박철수',
        'evidence': '메시지 기록, 증인',
      },
      {
        'id': 4,
        'status': '접수',
        'date': '2024.01.12',
        'reportType': '팀 내 따돌림',
        'title': '집단 따돌림',
        'description': '팀 내 모든 동료들로부터 따돌림을 당하고 있습니다.',
        'reportedUser': '팀 전체',
        'evidence': '이메일 제외, 회의 미참석 지시',
      },
      {
        'id': 5,
        'status': '완료',
        'date': '2024.01.08',
        'reportType': '차별',
        'title': '성별에 따른 급여 차별',
        'description': '같은 직책이지만 여성 직원이 남성 직원보다 급여를 적게 받고 있습니다.',
        'reportedUser': '인사팀',
        'evidence': '급여명세서, 계약서',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('신고내역'),
        centerTitle: true,
        elevation: 0,
      ),
      body: reports.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.exclamationmark_circle,
                    size: 48,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '신고 기록이 없습니다',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: reports.length,
              itemBuilder: (context, index) {
                final report = reports[index];
                return _buildReportCard(context, report);
              },
            ),
    );
  }

  Widget _buildReportCard(BuildContext context, Map<String, dynamic> report) {
    Color statusColor;
    switch (report['status']) {
      case '완료':
        statusColor = Colors.green;
        break;
      case '조사중':
        statusColor = Colors.blue;
        break;
      case '처리중':
        statusColor = Colors.orange;
        break;
      case '접수':
        statusColor = Colors.grey;
        break;
      default:
        statusColor = Colors.grey;
    }

    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('신고 상세 페이지: ${report['title']}')),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 상단: 상태, 타입, 날짜
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 상태 배지
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    report['status'],
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: statusColor,
                    ),
                  ),
                ),
                // 날짜
                Text(
                  report['date'],
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // 신고 타입
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                report['reportType'],
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.red[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // 제목
            Text(
              report['title'],
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            // 설명
            Text(
              report['description'],
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[700],
                height: 1.4,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            // 신고 대상
            Row(
              children: [
                Icon(
                  CupertinoIcons.person_fill,
                  size: 14,
                  color: Colors.grey[600],
                ),
                const SizedBox(width: 6),
                Text(
                  '신고 대상: ${report['reportedUser']}',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // 증거 자료
            Row(
              children: [
                Icon(
                  CupertinoIcons.doc_text,
                  size: 14,
                  color: Colors.grey[600],
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    '증거: ${report['evidence']}',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
