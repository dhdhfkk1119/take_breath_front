import 'package:flutter/material.dart';
import 'package:take_breath/presentation/pages/auth/social/social_page.dart';
import 'dart:async';
import 'package:take_breath/presentation/pages/index_stack_page/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _fadeAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_animationController);

    // 2.5초 후 페이드아웃 시작
    Timer(const Duration(milliseconds: 2500), () {
      if (mounted) {
        _animationController.forward();
      }
    });

    // 3초 후 메인 화면으로 전환
    Timer(const Duration(milliseconds: 3000), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SocialPage(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFF0FDFA), // teal-50
                Color(0xFFECFEFF), // cyan-50
                Color(0xFFEFF6FF), // blue-50
              ],
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 로고
                    _buildLogo(),
                    const SizedBox(height: 32),

                    // 앱 이름
                    const Text(
                      'Take Breath',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // 서브 텍스트
                    const Text(
                      '당신의 이야기를 들어드릴게요',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(height: 48),

                    // 로딩 애니메이션
                    _buildLoadingDots(),
                  ],
                ),
              ),

              // 하단 텍스트
              const Positioned(
                bottom: 48,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    '당신의 이야기를 익명으로 안전하게 지켜드립니다',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.8, end: 1.0),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Opacity(
            opacity: value,
            child: CustomPaint(
              size: const Size(120, 120),
              painter: LogoPainter(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoadingDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          builder: (context, value, child) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: const Color(0xFF06B6D4),
                borderRadius: BorderRadius.circular(4),
              ),
              transform: Matrix4.translationValues(
                0,
                -10 * ((value - (index * 0.15)).abs() * 2 - 1).abs(),
                0,
              ),
            );
          },
        );
      }),
    );
  }
}

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // 외부 원 (보호막)
    final outerCirclePaint = Paint()
      ..color = const Color(0xFF06B6D4).withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawCircle(center, 50, outerCirclePaint);

    // 내부 원
    final innerCirclePaint = Paint()
      ..color = const Color(0xFF0891B2).withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(center, 40, innerCirclePaint);

    // 하트 모양
    final heartPaint = Paint()
      ..color = const Color(0xFF0891B2).withOpacity(0.9)
      ..style = PaintingStyle.fill;

    final heartPath = Path();
    heartPath.moveTo(center.dx, center.dy + 15);
    heartPath.cubicTo(
      center.dx - 10,
      center.dy + 8,
      center.dx - 25,
      center.dy - 2,
      center.dx - 25,
      center.dy - 12,
    );
    heartPath.cubicTo(
      center.dx - 25,
      center.dy - 22,
      center.dx - 18,
      center.dy - 28,
      center.dx - 10,
      center.dy - 28,
    );
    heartPath.cubicTo(
      center.dx - 5,
      center.dy - 28,
      center.dx - 2,
      center.dy - 25,
      center.dx,
      center.dy - 22,
    );
    heartPath.cubicTo(
      center.dx + 2,
      center.dy - 25,
      center.dx + 5,
      center.dy - 28,
      center.dx + 10,
      center.dy - 28,
    );
    heartPath.cubicTo(
      center.dx + 18,
      center.dy - 28,
      center.dx + 25,
      center.dy - 22,
      center.dx + 25,
      center.dy - 12,
    );
    heartPath.cubicTo(
      center.dx + 25,
      center.dy - 2,
      center.dx + 10,
      center.dy + 8,
      center.dx,
      center.dy + 15,
    );
    heartPath.close();

    canvas.drawPath(heartPath, heartPaint);

    // 체크마크
    final checkPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final checkPath = Path();
    checkPath.moveTo(center.dx - 8, center.dy - 10);
    checkPath.lineTo(center.dx - 3, center.dy - 5);
    checkPath.lineTo(center.dx + 8, center.dy - 16);

    canvas.drawPath(checkPath, checkPaint);

    // 반짝이는 점들
    final sparkPaint = Paint()
      ..color = const Color(0xFF06B6D4).withOpacity(0.6)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(center.dx + 25, center.dy - 25), 2, sparkPaint);
    canvas.drawCircle(Offset(center.dx - 25, center.dy + 25), 2, sparkPaint);
    canvas.drawCircle(Offset(center.dx + 30, center.dy + 10), 1.5, sparkPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
