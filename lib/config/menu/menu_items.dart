import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: "Buttons",
      subTitle: "Types of buttons in Flutter",
      link: "/buttons",
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: "Cards",
      subTitle: "Styled Cards",
      link: "/cards",
      icon: Icons.credit_card),
  MenuItem(
      title: "Progress Indicators",
      subTitle: "Controlled and uncontrolled",
      link: "/progress",
      icon: Icons.refresh_outlined),
  MenuItem(
      title: "Snackbar and dialogs",
      subTitle: "Showing",
      link: "/snackbar",
      icon: Icons.message_outlined),
  MenuItem(
      title: "Animated Container",
      subTitle: "Shows animation when tap",
      link: "/animated_container",
      icon: Icons.square_outlined),
  MenuItem(
      title: "Ui controls + Tiles",
      subTitle: "UI Controls in flutter",
      link: "/ui_controls",
      icon: Icons.square_outlined),
  MenuItem(
      title: "Tutorial",
      subTitle: "Tutorial screen",
      link: "/tutorial",
      icon: Icons.accessibility_new_outlined),
  MenuItem(
      title: "Infinite scroll and pull",
      subTitle: "pull to refresh and infinite scroll",
      link: "/infinite_scroll",
      icon: Icons.list_alt_rounded),
  MenuItem(
      title: "Change theme",
      subTitle: "Themes for the app",
      link: "/theme",
      icon: Icons.theater_comedy),
];
