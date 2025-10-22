import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_breath/presentation/pages/index_stack_page/chat/chat_list/chat_list_page.dart';
import 'package:take_breath/presentation/pages/index_stack_page/counselor/list_page/counselor_list_page.dart';
import 'package:take_breath/presentation/pages/index_stack_page/mypage/list_page/mypage_list_page.dart';
import 'package:take_breath/presentation/pages/index_stack_page/recoder/list_page/recoder_list_page.dart';
import 'community/list_page/community_list_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFF96666);

    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const CommunityListPage(),
          const RecorderListPage(),
          const CounselorListPage(),
          const ChatListPage(),
          const MypageListPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(label: '커뮤니티', icon: Icon(Icons.comment)),
            BottomNavigationBarItem(label: '기록실', icon: Icon(Icons.radio)),
            BottomNavigationBarItem(label: '상담리스트', icon: Icon(Icons.people)),
            BottomNavigationBarItem(
                label: '채팅', icon: Icon(CupertinoIcons.chat_bubble_text_fill)),
            BottomNavigationBarItem(
                label: 'MY', icon: Icon(CupertinoIcons.profile_circled))
          ]),
    );
  }
}
