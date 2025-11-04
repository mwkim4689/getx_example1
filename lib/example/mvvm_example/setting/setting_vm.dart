// ============================================
// MVVM 패턴: ViewModel (Controller)
// ============================================
// ViewModel은 비즈니스 로직과 상태 관리를 담당합니다.

import 'package:get/get.dart';
import 'setting_state.dart';

class SettingVM extends GetxController {
  // State를 .obs로 만들어 반응형 상태로 관리
  var state = SettingState(isDarkMode: false).obs;

  // 비즈니스 로직: 다크모드 토글
  void toggleDarkMode() {
    state.value = state.value.copyWith(isDarkMode: !state.value.isDarkMode);
  }
}
