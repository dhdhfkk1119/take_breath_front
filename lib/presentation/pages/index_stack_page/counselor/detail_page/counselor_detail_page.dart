import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:take_breath/domain/counselor/models/counselor_response.dart';
import 'widgets/counselor_detail_header_with_phone_call.dart';
import 'widgets/counselor_detail_review.dart';

class CounselorDetailPage extends StatelessWidget {
  final CounselorResponse counselor;

  const CounselorDetailPage({
    Key? key,
    required this.counselor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('상담사 프로필'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CounselorDetailHeader(counselor: counselor),
            const SizedBox(height: 20),
            CounselorDetailReview(counselor: counselor),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
