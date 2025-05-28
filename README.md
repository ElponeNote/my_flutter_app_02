# SkoolKorea Flutter Profile Sample

이 프로젝트는 Flutter로 구현한 인스타그램 스타일의 프로필/피드 샘플 클론입니다.

## 주요 구현 내역 (2024-06)

### 1. 전체 테마 및 배경
- 전체 배경색: 검정색(Colors.black)
- AppBar, 텍스트 등 다크모드 스타일 적용

### 2. 상단 AppBar
- 좌측: 자물쇠(비공개) 아이콘 + 계정명(`user_skool chef`) + ▼(계정 전환)
- ▼ 클릭 시 계정 전환/관리 BottomSheet 표시
- 우측: + 버튼(새 게시물), 3선 메뉴(햄버거, Drawer)

### 3. 프로필 영역
- 프로필 사진, 이름(스쿨셰프), 소개(바이브코딩 | 플러터개발 | 커뮤니티 운영) 우측에 좌측정렬로 배치
- 게시물/팔로워/팔로잉 통계(24, 1.2K, 180) 표시
- 프로필 편집 버튼 + 사람 추가(OutlinedButton, 곡률 8)

### 4. 스토리 하이라이트
- 상단에 '스토리 하이라이트' 문구
- 첫 항목: 신규(+) 버튼(클릭 시 스낵바)
- 이후 6개: 하이라이트 이미지/라벨
- **하이라이트 이미지는 `assets/highlights/` 폴더에 별도 저장 (예: highlight1.jpg, highlight2.jpg 등)**

### 5. 게시물 그리드
- 12장의 post 이미지(assets/images/post1~12.jpg) 3x4 그리드로 노출

### 6. 기타
- Drawer(설정, 내 정보, 로그아웃)
- 모든 텍스트 색상, 버튼 스타일 샘플과 유사하게 커스텀

---

## 하이라이트 샘플 이미지 생성 및 등록 방법

1. `assets/highlights/` 폴더를 생성합니다.
2. 하이라이트에 사용할 이미지를 `highlight1.jpg` ~ `highlight6.jpg`로 저장합니다.
   - 예시: `assets/highlights/highlight1.jpg`, ..., `assets/highlights/highlight6.jpg`
3. `pubspec.yaml`의 `assets:` 항목에 위 파일 경로를 모두 추가합니다.
   - 이미 등록되어 있다면 별도 작업 불필요
4. `flutter pub get` 명령어로 반영합니다.

> 샘플 프로젝트에는 임시로 profile.jpg를 복사해 highlight1~6.jpg로 사용 중입니다. 실제 이미지는 교체만 하면 바로 반영됩니다.

---

## 참고/다음 작업
- 실제 게시물 작성, 계정 추가/전환, Drawer 메뉴 기능 등 세부 구현 필요
- 추가 UI/UX 개선 및 기능 확장 가능

