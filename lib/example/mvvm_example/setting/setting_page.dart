// ============================================
// MVVM 패턴: View (Page)
// ============================================
// View는 UI만 담당합니다.

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'setting_vm.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller 등록
    final SettingVM settingVM = Get.put(SettingVM());
    return Scaffold(
      appBar: AppBar(title: Text('설정 (MVVM 예제)'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Obx로 감싸서 state 변경을 자동 반영
            Obx(
              () => Card(
                child: SwitchListTile(
                  title: Text(
                    '다크 모드',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    settingVM.state.value.isDarkMode ? '켜짐' : '꺼짐',
                    style: TextStyle(
                      color: settingVM.state.value.isDarkMode
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  ),
                  value: settingVM.state.value.isDarkMode,
                  onChanged: (value) {
                    // Controller의 비즈니스 로직 호출
                    settingVM.toggleDarkMode();
                  },
                  secondary: Icon(
                    settingVM.state.value.isDarkMode
                        ? Icons.dark_mode
                        : Icons.light_mode,
                    size: 32,
                    color: settingVM.state.value.isDarkMode
                        ? Colors.indigo
                        : Colors.orange,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // MVVM 패턴 설명
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MVVM 패턴 구조',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• Model (State): 데이터만 정의',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    '• ViewModel (Controller): 비즈니스 로직 + .obs로 상태 관리',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    '• View (Page): Obx로 UI만 표시',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
