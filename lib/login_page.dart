import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();
  User? _user;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _user = _authService.currentUser;
  }

  Future<void> _signIn() async {
    setState(() => _loading = true);
    final result = await _authService.signInWithGoogle();
    setState(() {
      _user = result?.user ?? _authService.currentUser;
      _loading = false;
    });
  }

  Future<void> _signOut() async {
    setState(() => _loading = true);
    await _authService.signOut();
    setState(() {
      _user = null;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('구글 로그인 테스트')),
      body: Center(
        child:
            _loading
                ? const CircularProgressIndicator()
                : _user == null
                ? ElevatedButton.icon(
                  icon: Image.asset(
                    'assets/images/google_logo.png',
                    height: 24,
                  ),
                  label: const Text('구글로 로그인'),
                  onPressed: _signIn,
                )
                : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(_user!.photoURL ?? ''),
                      radius: 40,
                    ),
                    const SizedBox(height: 16),
                    Text(_user!.displayName ?? '이름 없음'),
                    Text(_user!.email ?? '이메일 없음'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _signOut,
                      child: const Text('로그아웃'),
                    ),
                  ],
                ),
      ),
    );
  }
}
