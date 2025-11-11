import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/comment/models/community_comment_response.dart';
import '../../../../../domain/comment/providers/community_comment_provider.dart';
import '../../community/detail_page/community_detail_page.dart';

class UserCommentListPage extends ConsumerStatefulWidget {
  const UserCommentListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<UserCommentListPage> createState() => _UserCommentHistoryPageState();
}

class _UserCommentHistoryPageState extends ConsumerState<UserCommentListPage> {
  final ScrollController _scrollController = ScrollController();

  List<CommunityCommentResponse> _comments = [];
  int _currentPage = 0;
  bool _isLoading = false;
  bool _hasMore = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadComments();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9 &&
        !_isLoading &&
        _hasMore) {
      _loadMoreComments();
    }
  }

  Future<void> _loadComments() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      print('🔍 댓글 목록 조회 시작...');
      final repository = ref.read(communityCommentRepositoryProvider);
      final pageResponse = await repository.findMyComments(
        page: 0,
        size: 10,
      );

      print('✅ 댓글 ${pageResponse.content.length}개 로드됨'); // 추가
      print('📄 댓글 내용: ${pageResponse.content}'); // 추가

      setState(() {
        _comments = pageResponse.content;
        _currentPage = 0;
        _hasMore = !pageResponse.isLast;
        _isLoading = false;
      });
    } catch (e) {
      print('❌ 댓글 로드 실패: $e'); // 추가
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _loadMoreComments() async {
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final repository = ref.read(communityCommentRepositoryProvider);
      final pageResponse = await repository.findMyComments(
        page: _currentPage + 1,
        size: 10,
      );

      setState(() {
        _comments.addAll(pageResponse.content);
        _currentPage++;
        _hasMore = !pageResponse.isLast;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('더 불러오기 실패: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('작성한 댓글 목록'),
        centerTitle: true,
        elevation: 0,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    // 에러 상태
    if (_error != null && _comments.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.exclamationmark_triangle,
              size: 48,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              '오류가 발생했습니다',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _error!,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[500],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadComments,
              child: const Text('다시 시도'),
            ),
          ],
        ),
      );
    }

    // 로딩 중 (첫 로딩)
    if (_isLoading && _comments.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // 빈 상태
    if (_comments.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.chat_bubble,
              size: 48,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              '작성한 댓글이 없습니다',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    // 댓글 목록
    return RefreshIndicator(
      onRefresh: _loadComments,
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(16),
        itemCount: _comments.length + (_hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= _comments.length) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(),
              ),
            );
          }
          return _buildCommentCard(context, _comments[index]);
        },
      ),
    );
  }

  Widget _buildCommentCard(BuildContext context, CommunityCommentResponse comment) {
    return GestureDetector(
      onTap: () async {
        // 상세 페이지로 이동
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CommunityDetailPage(id: comment.postId),
          ),
        );

        // 돌아온 후에만 SnackBar 실행
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('게시글로 이동: ${comment.postTitle}')),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 게시글 제목
            Row(
              children: [
                Icon(
                  CupertinoIcons.doc_text,
                  size: 14,
                  color: Colors.grey[600],
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    comment.postTitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // 댓글 내용
            Text(
              comment.content,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.4,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            // 날짜
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDate(comment.createdAt),
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
                ),
                // 수정/삭제 상태 표시
                if (comment.modified)
                  Text(
                    '수정됨',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[500],
                    ),
                  ),
                if (comment.deleted)
                  Text(
                    '삭제됨',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.red[400],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      final difference = now.difference(date);

      if (difference.inDays == 0) {
        if (difference.inHours == 0) {
          if (difference.inMinutes == 0) {
            return '방금 전';
          }
          return '${difference.inMinutes}분 전';
        }
        return '${difference.inHours}시간 전';
      } else if (difference.inDays < 7) {
        return '${difference.inDays}일 전';
      } else {
        return '${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')}';
      }
    } catch (e) {
      return dateString;
    }
  }
}
