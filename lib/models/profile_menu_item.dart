import 'package:flutter/material.dart';

enum ProfileMenuItemType { navigation, toggle, action }

class ProfileMenuItem {
  final String title;
  final IconData icon;
  final ProfileMenuItemType type;
  final bool? isToggled;
  final VoidCallback? onTap;
  final bool isDivider;
  final bool isDestructive;

  ProfileMenuItem({
    required this.title,
    required this.icon,
    required this.type,
    this.isToggled,
    this.onTap,
    this.isDivider = false,
    this.isDestructive = false,
  });
}
