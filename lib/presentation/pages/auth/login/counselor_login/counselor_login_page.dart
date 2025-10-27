import 'package:flutter/material.dart';
import 'package:take_breath/_core/utils/widgets_app_bar.dart';
import 'widgets/counselor_login_form.dart';

class CounselorLoginPage extends StatelessWidget {
  const CounselorLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsAppBar(
        title: "상담사 로그인 페이지",
      ),
      body: CounselorLoginForm(),
    );
  }
}
