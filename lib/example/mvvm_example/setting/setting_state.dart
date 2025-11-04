// ============================================
// MVVM 패턴: Model (State)
// ============================================
// Model은 데이터 구조만 정의합니다.

class SettingState {
  // 설정 데이터: 다크모드 on/off
  final bool isDarkMode;

  SettingState({
    required this.isDarkMode,
  });

  // 데이터 복사를 위한 메서드
  SettingState copyWith({
    bool? isDarkMode,
  }) {
    return SettingState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
