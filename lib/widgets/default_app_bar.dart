import 'package:flutter/material.dart';
import 'package:huurdersapp/constants/app_colors.dart';

AppBar defaultAppBar(String title) {
  return AppBar(

    title: Text(title),
    centerTitle: true,
    backgroundColor: AppColors.yellow,
  );
}
