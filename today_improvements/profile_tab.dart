import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final avatarRadius = screenWidth * 0.13;
    final horizontalPadding = screenWidth * 0.04;
    final verticalPadding = screenWidth * 0.06;
    final statSpacing = screenWidth * 0.06;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: _AccountTitle(),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined),
            tooltip: '새 게시물',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('새 게시물 작성 화면으로 이동(예시)')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            tooltip: '메뉴',
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Text('메뉴', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text('설정', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: Text('내 정보', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text('로그아웃', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: verticalPadding / 2,
                  horizontal: horizontalPadding,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 프로필 사진
                    CircleAvatar(
                      radius: avatarRadius,
                      backgroundImage: const AssetImage('assets/images/profile.jpg'),
                    ),
                    SizedBox(width: statSpacing / 2),
                    // 이름, 소개 (프로필 사진 우측에 좌측정렬)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('스쿨셰프', style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.05, color: Colors.white, decoration: TextDecoration.none)),
                          SizedBox(height: screenWidth * 0.01),
                          Text('바이브코딩 | 플러터개발 | 커뮤니티 운영', style: TextStyle(fontSize: screenWidth * 0.038, color: Colors.white, decoration: TextDecoration.none)),
                          SizedBox(height: screenWidth * 0.025),
                          // 게시물/팔로워/팔로잉 통계 복원
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildStatColumn('게시물', '24', screenWidth * 0.95),
                              SizedBox(width: statSpacing),
                              _buildStatColumn('팔로워', '1.2K', screenWidth * 0.95),
                              SizedBox(width: statSpacing),
                              _buildStatColumn('팔로잉', '180', screenWidth * 0.95),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // 프로필 편집 버튼 + 아이콘 버튼
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: screenWidth * 0.02),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('프로필 편집'),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
                          textStyle: TextStyle(fontSize: screenWidth * 0.04, color: Colors.white),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          side: BorderSide(color: Colors.white24),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 44,
                      width: 44,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          side: BorderSide(color: Colors.white24),
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('친구 추가/공유/팔로우 등 기능 구현')),
                          );
                        },
                        child: const Icon(Icons.person_add_alt, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              // 게시물 그리드 위에 스토리(원형 레이아웃) 추가
              Padding(
                padding: EdgeInsets.only(left: horizontalPadding, bottom: screenWidth * 0.01),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('스토리 하이라이트', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: screenWidth * 0.042)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
                child: SizedBox(
                  height: screenWidth * 0.22,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      // 신규 + 버튼
                      _buildAddStoryCircle(context),
                      _buildStoryCircle('assets/highlights/highlight1.jpg', '하이라이트'),
                      _buildStoryCircle('assets/highlights/highlight2.jpg', '하이라이트'),
                      _buildStoryCircle('assets/highlights/highlight3.jpg', '하이라이트'),
                      _buildStoryCircle('assets/highlights/highlight4.jpg', '하이라이트'),
                      _buildStoryCircle('assets/highlights/highlight5.jpg', '하이라이트'),
                      _buildStoryCircle('assets/highlights/highlight6.jpg', '하이라이트'),
                    ],
                  ),
                ),
              ),
              // 게시물 그리드
              LayoutBuilder(
                builder: (context, constraints) {
                  final gridWidth = constraints.maxWidth;
                  final crossAxisCount = 3;
                  final gridSpacing = 2.0;
                  final itemSize = (gridWidth - (crossAxisCount - 1) * gridSpacing) / crossAxisCount;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(2),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: gridSpacing,
                      mainAxisSpacing: gridSpacing,
                      childAspectRatio: 1,
                    ),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return Container(
                        width: itemSize,
                        height: itemSize,
                        color: Colors.grey[300],
                        child: Image.asset(
                          'assets/images/post${index + 1}.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, size: 40),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatColumn(String label, String count, double screenWidth) {
    return Column(
      children: [
        Text(count, style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.045, color: Colors.white, decoration: TextDecoration.none)),
        SizedBox(height: screenWidth * 0.01),
        Text(label, style: TextStyle(color: Colors.white70, fontSize: screenWidth * 0.035, decoration: TextDecoration.none)),
      ],
    );
  }

  Widget _buildStoryCircle(String imagePath, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 13, decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }

  // 신규 + 스토리 하이라이트 원형 버튼
  Widget _buildAddStoryCircle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('새 하이라이트 추가 기능')),
              );
            },
            child: CircleAvatar(
              radius: 32,
              backgroundColor: Colors.white12,
              child: Icon(Icons.add, color: Colors.white, size: 32),
            ),
          ),
          const SizedBox(height: 6),
          const Text('신규', style: TextStyle(color: Colors.white, fontSize: 13, decoration: TextDecoration.none)),
        ],
      ),
    );
  }
}

// 상단 계정명/비공개/드롭다운 위젯
class _AccountTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.lock, size: 20, color: Colors.white),
        const SizedBox(width: 6),
        const Text('user_skool chef', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
        const SizedBox(width: 2),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    const Text('계정 전환/관리', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                    const Divider(color: Colors.white24),
                    ListTile(
                      leading: const Icon(Icons.account_circle, color: Colors.white),
                      title: const Text('user_skool chef', style: TextStyle(color: Colors.white)),
                      subtitle: const Text('현재 계정', style: TextStyle(color: Colors.white54, fontSize: 12)),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.add, color: Colors.white),
                      title: const Text('계정 추가', style: TextStyle(color: Colors.white)),
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.arrow_drop_down, size: 24, color: Colors.white),
        ),
      ],
    );
  }
} 