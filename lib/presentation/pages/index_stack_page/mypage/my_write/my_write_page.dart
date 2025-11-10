import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/community/models/community_list.dart';
import 'package:take_breath/domain/community/providers/community_repository_provider.dart';

import '../../community/detail_page/community_detail_page.dart';

class UserPostListPage extends ConsumerStatefulWidget {
  const UserPostListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<UserPostListPage> createState() => _UserPostListPageState();
}

class _UserPostListPageState extends ConsumerState<UserPostListPage> {
  final ScrollController _scrollController = ScrollController();

  List<CommunityList> _posts = [];
  int _currentPage = 0;
  bool _isLoading = false;
  bool _hasMore = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadPosts();
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
      _loadMorePosts();
    }
  }

  Future<void> _loadPosts() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final repository = ref.read(communityRepositoryProvider);
      final pageResponse = await repository.getMyPosts(
        page: 0,
        size: 10,
      );

      setState(() {
        _posts = pageResponse.content;
        _currentPage = 0;
        _hasMore = !pageResponse.last;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _loadMorePosts() async {
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final repository = ref.read(communityRepositoryProvider);
      final pageResponse = await repository.getMyPosts(
        page: _currentPage + 1,
        size: 10,
      );

      setState(() {
        _posts.addAll(pageResponse.content);
        _currentPage++;
        _hasMore = !pageResponse.last;
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
        title: const Text('작성한 글 목록'),
        centerTitle: true,
        elevation: 0,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    // 에러 상태
    if (_error != null && _posts.isEmpty) {
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
              onPressed: _loadPosts,
              child: const Text('다시 시도'),
            ),
          ],
        ),
      );
    }

    // 로딩 중 (첫 로딩)
    if (_isLoading && _posts.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // 빈 상태
    if (_posts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.doc_text,
              size: 48,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              '작성한 글이 없습니다',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    // 게시글 목록
    return RefreshIndicator(
      onRefresh: _loadPosts,
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(16),
        itemCount: _posts.length + (_hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= _posts.length) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(),
              ),
            );
          }
          return _buildPostCard(context, _posts[index]);
        },
      ),
    );
  }

  Widget _buildPostCard(BuildContext context, CommunityList post) {
    return GestureDetector(
      onTap: () async {
        // 상세 페이지로 이동
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CommunityDetailPage(id: post.id),
          ),
        );

        // 돌아온 후에만 SnackBar 실행
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('글 상세 페이지: ${post.title}')),
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
            // 카테고리 (있는 경우)
            if (post.categoryName.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    post.categoryName,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.blue[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            // 제목
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            // 내용 미리보기
            Text(
              post.preview,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[700],
                height: 1.4,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            // 날짜 및 통계
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDate(post.createdAt),
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
                ),
                Row(
                  children: [
                    _buildStatItem(
                      icon: CupertinoIcons.heart,
                      count: post.likeCount,
                    ),
                    const SizedBox(width: 12),
                    _buildStatItem(
                      icon: CupertinoIcons.chat_bubble,
                      count: post.commentCount,
                    ),
                    const SizedBox(width: 12),
                    _buildStatItem(
                      icon: CupertinoIcons.eye,
                      count: post.viewCount,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem({required IconData icon, required int count}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14,
          color: Colors.grey[600],
        ),
        const SizedBox(width: 4),
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey[600],
          ),
        ),
      ],
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