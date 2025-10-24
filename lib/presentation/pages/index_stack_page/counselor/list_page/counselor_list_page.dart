import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'models/counselor_model.dart';
import 'widgets/counselor_list_body.dart';

class CounselorListPage extends StatefulWidget {
  const CounselorListPage({Key? key}) : super(key: key);

  @override
  State<CounselorListPage> createState() => _CounselorListPageState();
}

class _CounselorListPageState extends State<CounselorListPage> {
  final List<CounselorModel> counselors = [
    CounselorModel(
      id: 1,
      name: '최영희',
      specialty: '마스터 상담사',
      rating: 4.5,
      reviewCount: 581,
      description: '#직장 #대인관계 #커리어 #심리상담 #커플상담 #트라우마 #불안장애',
      consultFee: 80000,
      reviewFee: 80000,
      badge: '인기',
      imageUrl: '',
      isFavorite: false,
    ),
    CounselorModel(
      id: 2,
      name: '하윤희',
      specialty: '전문 상담사',
      rating: 4.5,
      reviewCount: 230,
      description: '#직장괴롭힘 #커리어 #성장 #심리상담 #갈등해결 #직장스트레스',
      consultFee: 45000,
      reviewFee: 45000,
      badge: '추천',
      imageUrl: '',
      isFavorite: false,
    ),
    CounselorModel(
      id: 3,
      name: '김희정',
      specialty: '전문 상담사',
      rating: 4.5,
      reviewCount: 23,
      description: '#직장생활 #커리어 #관계문제 #코칭 #스트레스 #성향분석',
      consultFee: 45000,
      reviewFee: 45000,
      badge: 'NEW',
      imageUrl: '',
      isFavorite: false,
    ),
    CounselorModel(
      id: 4,
      name: '이초연',
      specialty: '전문 상담사',
      rating: 4.5,
      reviewCount: 395,
      description: '#직장 #커리어 #관계문제 #심리상담 #스트레스 #성장코칭',
      consultFee: 50000,
      reviewFee: 50000,
      badge: '',
      imageUrl: '',
      isFavorite: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상담사 리스트'),
        centerTitle: true,
        elevation: 0,
      ),
      body: CounselorListBody(
        counselors: counselors,
      ),
    );
  }
}
