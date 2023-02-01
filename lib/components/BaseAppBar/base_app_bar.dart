import 'package:flutter/material.dart';
import 'package:fluttertesting/themes/colors.dart';

class BaseAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;

  const BaseAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: AppColors.black9),
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: BackButton(
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(title ?? "",
        style: const TextStyle(
          fontWeight: FontWeight.w900, color: AppColors.black9)),
          centerTitle: true,
    );
  }

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}