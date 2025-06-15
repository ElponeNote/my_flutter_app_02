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

## iOS 및 Android 개발 환경 문제 해결 및 실행 기록

### 1. iOS: 개발자 인증서 신뢰 문제 해결
- **문제:**
  - 앱 실행 시 "신뢰하지 않는 개발자" 오류 발생
  - Xcode/Flutter에서 빌드 및 설치는 되지만, 아이폰에서 앱 실행이 차단됨
- **해결 방법:**
  1. 아이폰에서 `설정 > 일반 > VPN 및 기기 관리`로 이동
  2. `Apple Development: winterboy21@hotmail.co.kr (9QVTNJ57PG)` 또는 `Developer App` 항목을 찾아 터치
  3. "신뢰(Trust)" 버튼을 눌러 신뢰 허용
  4. 필요시 앱 삭제 후 재설치
  5. 문제 지속 시 Xcode에서 직접 `Product > Run` 실행

### 2. Android Studio: Gradle Sync 메뉴가 보이지 않을 때
- **문제:**
  - `File > Sync Project with Gradle Files` 메뉴가 보이지 않음
- **해결 방법:**
  1. 상단 툴바의 코끼리(Sync) 아이콘 클릭
  2. Gradle 패널의 새로고침(⟳) 아이콘 클릭
  3. `Command + Shift + A`로 "Sync Project with Gradle Files" 검색 후 실행
  4. `File > Invalidate Caches / Restart...`로 강제 새로고침
  5. 터미널에서 `./gradlew --refresh-dependencies` 실행

### 3. Xcode 빌드 오류: build/ios/iphoneos 폴더 삭제 불가
- **문제:**
  - `Could not delete .../build/ios/iphoneos because it was not created by the build system ...`
- **해결 방법:**
  1. 터미널에서 `rm -rf /Volumes/1TB/my_flutter_app_02new/build/ios/iphoneos`로 직접 삭제
  2. `flutter clean` 실행
  3. 필요시 `rm -rf ~/Library/Developer/Xcode/DerivedData`로 Xcode 임시 데이터 삭제
  4. 다시 빌드 및 실행

### 4. 기타 참고 사항
- iOS 앱을 실기기에서 실행할 때는 반드시 개발자 인증서를 신뢰해야 함
- Android/Flutter 빌드 오류 발생 시 `flutter clean`과 캐시 삭제가 효과적임
- Xcode/Flutter 빌드 후 앱이 자동 실행되지 않으면 Xcode에서 직접 실행 시도

---

## 현재 상태
- **iPhone 15 Pro Max 시뮬레이터**와 **실제기기 iPhone CSRyoo(mobile)**에서 앱이 정상적으로 실행되고 있음

---

> 다음 작업 진행 시, 위의 문제 해결 과정을 반드시 참고할 것!

