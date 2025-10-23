import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class BottomMenuItem {
  final String title;
  final Icon? icon;
  final VoidCallback onTap;

  BottomMenuItem({required this.title, this.icon, required this.onTap});
}

void showReportBottomSheet({
  required BuildContext context,
  required VoidCallback onReport,
  required int postId,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // 키보드가 올라와도 기본 화면이 가려지지 않게 해줌
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          // 높이 지정
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
                  const Text(
                    "게시물 신고하기",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const Divider(),
              const Text("신고 사유를 선택하거나 입력해 주세요.",
                  style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "상세 신고 사유 (선택 사항)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const Spacer(), // 남은 공간을 채워서 버튼을 하단에 붙입니다.
              // 4. 신고 버튼
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // 신고 처리 로직
                    Navigator.pop(context); // 팝업 닫기
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
