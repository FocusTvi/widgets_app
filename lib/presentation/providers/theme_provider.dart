import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkmodeProvider = StateProvider((ref) => false);
final selectedColorProvider = StateProvider((ref) => 0);

//Inmutable colors list

final colorListProvider = Provider((ref) => colorList);

//Apptheme object custom

final themeNofierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

//controller or notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  //state = new AppTheme()
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
