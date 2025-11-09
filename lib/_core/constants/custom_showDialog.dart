import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/report_target_type.dart';
import 'package:take_breath/_core/utils/snackbar_util.dart';
import 'package:take_breath/domain/report/comment_report/providers/comment_report_write_notifier.dart';
import 'package:take_breath/domain/report/community_report/models/community_report_request.dart';
import 'package:take_breath/domain/report/community_report/provider/community_report_write_notifier.dart';

void showBottomMenu({
  required BuildContext context,
  required List<BottomMenuItem> items,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: items
              .map((item) => ListTile(
                    leading: item.icon,
                    title: Text(item.title),
                    onTap: item.onTap,
                  ))
              .toList(),
        ),
      );
    },
  );
}

Future<void> _handleReport({
  required WidgetRef ref,
  required ReportTargetType type,
  required int targetId,
  required String reason,
}) async {
  switch (type) {
    case ReportTargetType.post:
      await ref
          .read(communityReportWriteProvider.notifier)
          .save(CommunityReportRequest(reason: reason), targetId);
      break;

    case ReportTargetType.comment:
      await ref
          .read(commentReportProvider.notifier)
          .reportComment(targetId, reason);
      break;

    case ReportTargetType.user:
      // 추후 유저 신고 기능 추가 시 여기에 연결
      break;
  }
}

class BottomMenuItem {
  final String title;
  final Icon? icon;
  final VoidCallback onTap;

  BottomMenuItem({required this.title, this.icon, required this.onTap});
}

void showReportBottomSheet({
  required BuildContext context,
  required VoidCallback onReport,
  required WidgetRef ref,
  required ReportTargetType targetType,
  required int targetId,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      final TextEditingController reasonController = TextEditingController();
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _getTitle(targetType),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const Divider(),
              const Text(
                "신고 사유를 선택하거나 입력해 주세요.",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              TextField(
                maxLines: 5,
                controller: reasonController,
                decoration: InputDecoration(
                  hintText: "상세 신고 사유 (선택 사항)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await _handleReport(
                      ref: ref,
                      type: targetType,
                      targetId: targetId,
                      reason: reasonController.text,
                    );

                    Navigator.pop(context);
                    SnackBarUtil.showSuccess(context, "신고가 정상 처리되었습니다");
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("신고 접수", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

String _getTitle(ReportTargetType type) {
  switch (type) {
    case ReportTargetType.post:
      return "게시물 신고하기";
    case ReportTargetType.comment:
      return "댓글 신고하기";
    case ReportTargetType.user:
      return "유저 신고하기";
  }
}
