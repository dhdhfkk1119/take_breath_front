import 'package:flutter/material.dart';
import 'package:take_breath/_core/constants/custom_color.dart';
import 'package:take_breath/presentation/pages/auth/social/widgets/social_body.dart';

class SocialPage extends StatelessWidget {
  const SocialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SocialBody(),
      ),
    );
  }
}
