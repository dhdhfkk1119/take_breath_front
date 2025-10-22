import 'package:flutter/material.dart';
import '../models/counselor_model.dart';
import 'counselor_item.dart';

class CounselorListBody extends StatelessWidget {
  final List<CounselorModel> counselors;
  final Function(CounselorModel) onItemTap;

  const CounselorListBody({
    Key? key,
    required this.counselors,
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: counselors.length,
      itemBuilder: (context, index) {
        return CounselorItem(
          counselor: counselors[index],
          onTap: () => onItemTap(counselors[index]),
        );
      },
    );
  }
}
