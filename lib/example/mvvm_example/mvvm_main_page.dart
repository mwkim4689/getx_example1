// ============================================
// GetX MVVM 패턴 예제 - 메인 페이지
// ============================================
//
// 이 예제는 GetX로 MVVM 패턴을 구현하는 방법을 보여줍니다.
//
// MVVM 패턴 구조:
// - Model (State): 데이터 구조만 정의 (profile_state.dart, setting_state.dart)
// - ViewModel (Controller): .obs로 State 관리 + 비즈니스 로직 (profile_controller.dart, setting_controller.dart)
// - View (Page): Obx로 UI 표시 (profile_page.dart, setting_page.dart)
//
// 페이지 흐름:
// 메인 페이지 → 프로필 페이지 → (톱니바퀴 아이콘) → 설정 페이지
// ============================================

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile/profile_page.dart';

class MvvmMainPage extends StatelessWidget {
  const MvvmMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX MVVM 패턴 예제'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 제목
              Text(
                'MVVM 패턴 학습',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              // 설명
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue[200]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MVVM 패턴이란?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '• Model: 데이터 구조 (State 클래스)',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      '• ViewModel: 상태 관리 + 로직 (Controller)',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      '• View: UI 표시 (Page + Obx)',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),

              // 프로필 페이지로 이동 버튼
              ElevatedButton(
                onPressed: () {
                  Get.to(() => ProfilePage());
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  '프로필 예제 시작',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
