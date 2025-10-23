import 'package:flutter/material.dart';
import '../../detail_page/counselor_detail_page.dart';
import '../models/counselor_model.dart';
import 'counselor_item.dart';

class CounselorListBody extends StatelessWidget {
  final List<CounselorModel> counselors;

  const CounselorListBody({
    Key? key,
    required this.counselors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: counselors.length,
      itemBuilder: (context, index) {
        return CounselorItem(
          counselor: counselors[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CounselorDetailPage(
                  counselor: counselors[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
