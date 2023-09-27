import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkmodeProvider = StateProvider((ref) => false);
final selectedColorProvider = StateProvider((ref) => 0);

//Inmutable colors list

final colorListProvider = Provider((ref) => colorList);
