import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(isDarkmodeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme changer"),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(isDarkmodeProvider.notifier)
                    .update((state) => state = !state);
              },
              icon: Icon(isDarkMode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined))
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final colors = ref.watch(colorListProvider);
    final selectedColor = ref.watch(selectedColorProvider);
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];
        return RadioListTile(
          title: Text(
            "This color",
            style: TextStyle(color: color),
          ),
          subtitle: Text("${color.value}"),
          activeColor: color,
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            ref.read(selectedColorProvider.notifier).state = value!;
          },
        );
      },
    );
  }
}
