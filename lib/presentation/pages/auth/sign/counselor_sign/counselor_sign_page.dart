import 'package:flutter/material.dart';
import 'package:take_breath/_core/utils/widgets_app_bar.dart';
import 'package:take_breath/presentation/pages/auth/sign/counselor_sign/widgets/counselor_sign_body.dart';

class CounselorSignPage extends StatelessWidget {
  const CounselorSignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsAppBar(title: "상담사 회원가입"),
      body: CounselorSignBody(),
    );
  }
}
