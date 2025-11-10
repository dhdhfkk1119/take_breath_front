import 'package:flutter/material.dart';
import 'package:take_breath/domain/counselor/models/counselor_response.dart';
import '../../detail_page/counselor_detail_page.dart';
import 'counselor_item.dart';

class CounselorListBody extends StatefulWidget {
  final List<CounselorResponse> counselors;
  final VoidCallback onLoadMore;

  const CounselorListBody({
    Key? key,
    required this.counselors,
    required this.onLoadMore,
  }) : super(key: key);

  @override
  _CounselorListBodyState createState() => _CounselorListBodyState();
}

class _CounselorListBodyState extends State<CounselorListBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        widget.onLoadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.counselors.length,
      itemBuilder: (context, index) {
        return CounselorItem(
          counselor: widget.counselors[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CounselorDetailPage(
                  counselor: widget.counselors[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
