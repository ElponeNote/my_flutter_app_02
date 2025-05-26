import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final avatarRadius = screenWidth * 0.13;
    final horizontalPadding = screenWidth * 0.04;
    final verticalPadding = screenWidth * 0.06;
    final statSpacing = screenWidth * 0.06;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding,
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
                  SizedBox(width: statSpacing),
                  // 게시물/팔로워/팔로잉
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatColumn('게시물', '24', screenWidth),
                        _buildStatColumn('팔로워', '1.2K', screenWidth),
                        _buildStatColumn('팔로잉', '180', screenWidth),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // 이름, 소개
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('홍길동', style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.05)),
                  SizedBox(height: screenWidth * 0.01),
                  Text('플러터 개발자 | 여행 | 사진', style: TextStyle(fontSize: screenWidth * 0.038)),
                  SizedBox(height: screenWidth * 0.02),
                ],
              ),
            ),
            // 프로필 편집 버튼
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
                        textStyle: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                    ),
                  ),
                ],
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
    );
  }

  Widget _buildStatColumn(String label, String count, double screenWidth) {
    return Column(
      children: [
        Text(count, style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.045)),
        SizedBox(height: screenWidth * 0.01),
        Text(label, style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.035)),
      ],
    );
  }
} 