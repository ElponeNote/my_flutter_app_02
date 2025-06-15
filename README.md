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

---

## [2024-06] Firebase 연동 및 구글 로그인 구현 상세 작업 내역

### 1. Firebase CLI 및 FlutterFire CLI 설치
```sh
npm install -g firebase-tools
dart pub global activate flutterfire_cli
```

### 2. Firebase 프로젝트 연동 및 초기화
```sh
firebase login
firebase init
```
- 필요한 Firebase 기능만 선택 (예: Firestore, Authentication 등)
- 프로젝트 연결 시 `Use an existing project` 선택

### 3. FlutterFire 연동
```sh
flutterfire configure
```
- 플랫폼 선택에서 android, ios 모두 체크(✔) 후 엔터
- Android application id(패키지명) 질문이 나오면 `com.example.my_flutter_app_02` 입력
- 기존 설정 재사용 여부는 n(no)로 답변하면 패키지명 입력 질문이 나옴
- `firebase_options.dart` 덮어쓰기 질문이 나오면 y(yes)로 답변

### 4. Android 패키지명 확인 및 AndroidManifest.xml 수정
- 패키지명: `com.example.my_flutter_app_02`
- `android/app/src/main/AndroidManifest.xml` 파일의 `<manifest>` 태그에 아래와 같이 추가:
```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.my_flutter_app_02">
```

### 5. pubspec.yaml 의존성 충돌 해결
- firebase_core, firebase_auth, google_sign_in 버전 호환성 주의
- 최종 적용 예시:
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  firebase_core: ^3.14.0
  firebase_auth: ^5.6.0
  google_sign_in: ^6.2.1
```
- 버전 충돌 시 pub.dev에서 실제 존재하는 최신 버전만 사용해야 함
- `flutter pub get`으로 의존성 설치

### 6. Gradle/플러그인 오류 해결
- settings.gradle.kts에서 아래 플러그인 선언 주석 처리:
```kotlin
// id("dev.flutter.flutter-plugin-loader") version "1.0.0"
```
- Gradle/Flutter 클린 빌드:
```sh
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter build apk
```

### 7. 구글 로그인 테스트용 인증 서비스 및 로그인 페이지 생성
- lib/auth_service.dart: 구글 로그인/로그아웃/현재 사용자 반환 AuthService 클래스 구현
- lib/login_page.dart: 구글 로그인 버튼, 로그인/로그아웃 상태 표시, AuthService 연동 UI 구현
- main.dart에서 home: LoginPage()로 설정 시 바로 테스트 가능

### 8. 기타 참고 사항
- pubspec.yaml, Gradle, AndroidManifest.xml 등 주요 설정 파일은 항상 버전/경로/문법을 꼼꼼히 점검
- 빌드/의존성 오류 발생 시, 에러 메시지와 pub.dev 공식 문서 참고
- iOS/Android 환경별 인증서, 캐시, 빌드 문제는 README 상단의 문제 해결법 참고

---

> 위 작업 내역을 참고하여, 추후 동일한 환경 세팅 및 문제 해결에 활용할 것!

