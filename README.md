# my_flutter_app_02

## 변경 이력

### 2024-02-22
- 인스타그램 스타일의 프로필 탭(ProfileTab) UI를 반응형(Responsive)으로 리팩터링
    - MediaQuery, SafeArea, Flexible, Expanded, LayoutBuilder 등 Flutter의 반응형 레이아웃 기능 적극 활용
    - 고정값 대신 화면 크기에 비례하는 비율 기반 크기 적용
    - 다양한 기기/해상도에서 UI가 자연스럽게 보이도록 개선

## 사용 방법
1. `lib/profile_tab.dart`에 반응형 프로필 UI 구현
2. `main.dart`에서 `ProfileTab`을 home으로 지정하여 앱 실행 시 바로 확인 가능
3. `assets` 폴더에 프로필/게시물 이미지 추가 필요 (예: profile.jpg, post1.jpg, post2.jpg, post3.jpg)
4. `pubspec.yaml`에 assets 경로 등록 후 `flutter pub get` 실행

---

