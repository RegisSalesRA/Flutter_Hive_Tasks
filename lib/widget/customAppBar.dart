import 'package:flutter/material.dart';
import '../css/colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  MyAppBar({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColors.background,
      centerTitle: true,
      title: Text(
        title!,
        style: const TextStyle(
          color: CustomColors.textColor,
        ),
      ),
    );
  }
}
