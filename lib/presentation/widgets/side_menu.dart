import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class SideMenu extends ConsumerStatefulWidget {
  final GlobalKey<ScaffoldState> scaffolKey;

  const SideMenu({super.key, required this.scaffolKey});

  @override
  ConsumerState<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends ConsumerState<SideMenu> {
  int navDrawerIndex = 1;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    final isDarkmode = ref.watch(themeNofierProvider).isDarkMode;
    // final isDarkmode = ref.watch(isDarkmodeProvider);
    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });
          widget.scaffolKey.currentState?.closeDrawer();
          context.push(appMenuItems[value].link);
        },
        children: [
          ...appMenuItems.map((menu) => NavigationDrawerDestination(
                icon: Icon(menu.icon),
                label: Text(menu.title),
              )),
          Divider(),
          SwitchListTile(

            title: Align(alignment:Alignment.center,child: const Text("DarkMode")),
            thumbIcon: MaterialStatePropertyAll(Icon(isDarkmode ? Icons.dark_mode_outlined : Icons.sunny)),
            value: isDarkmode,
            onChanged: (value) {
              ref.read(themeNofierProvider.notifier).toggleDarkMode();
            },
          )
        ]);
  }
}
