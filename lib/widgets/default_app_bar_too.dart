import 'package:flutter/material.dart';
import 'package:huurdersapp/constants/app_colors.dart';

AppBar defaultAppBar(String title, BuildContext context) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.close),
    ),
    title: Text(
      title,
    ),
    centerTitle: true,
    backgroundColor: AppColors.yellow,
  );
}
