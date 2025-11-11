import 'package:flutter/material.dart';
import 'package:take_breath/domain/counselor/models/counselor_response.dart';
import '../../detail_page/counselor_detail_page.dart';
import 'counselor_item.dart';

class CounselorListBody extends StatefulWidget {
  final List<CounselorResponse> counselors;
  final Future<void> Function() onLoadMore;
  final bool isLoadingMore;

  const CounselorListBody({
    Key? key,
    required this.counselors,
    required this.onLoadMore,
    this.isLoadingMore = false,
  }) : super(key: key);

  @override
  _CounselorListBodyState createState() => _CounselorListBodyState();
}

class _CounselorListBodyState extends State<CounselorListBody> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMoreLocal = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !_isLoadingMoreLocal &&
        !widget.isLoadingMore) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    _isLoadingMoreLocal = true;
    await widget.onLoadMore();
    _isLoadingMoreLocal = false;
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
      itemCount: widget.counselors.length + 1,
      itemBuilder: (context, index) {
        if (index == widget.counselors.length) {
          // 마지막에 로딩 표시
          return widget.isLoadingMore
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(child: CircularProgressIndicator()),
                )
              : const SizedBox.shrink();
        }

        final counselor = widget.counselors[index];
        return CounselorItem(
          counselor: counselor,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CounselorDetailPage(counselor: counselor),
              ),
            );
          },
        );
      },
    );
  }
}
